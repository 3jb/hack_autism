class HomeController < ApplicationController

	def index
		# responses = Response.all
		# states = State.all

		# @talk_value = params[:state]
		# @newsay = params[:response]

		# @talk_value.blank? ? @state = State.find_by_s_id(1) : @state = State.find_by_s_id(@talk_value)
		# @choices = Response.where(:current_state=>@state.s_id)

		# @newsay.blank? ? @talk = @state.toonsay : @talk = Response.where(:current_state=>@newsay,:next_state=>@talk_value).first.next_say

		@ws = GoogleSpreadsheet.quest_1

    steps = {}

    for row in 6..@ws.num_rows
    	step_id = @ws[row,1]
    	
    	step = (steps[step_id] ||= {})
    	step[:options] ||= []

      agentText = @ws[row,2] if !@ws[row,2].blank?


      step[:agentText] = agentText if agentText
      step[:options] << {
      	text: @ws[row,3],
      	response_quality: @ws[row,4],
      	nextStep: @ws[row,5],
      	oracleText: @ws[row,6]
      }

      
    end

    ap steps

end

 my.getQuest = function(questId) {
    return {
      agent: {
        name: "Tom",
        agentId: 1
      }
      result: {
        1: 5,# // 1 = Tom's agentId. 5 = Tom's state after quest is complete
        2: 4 #// 2 = Amy's agentId. 4 = Tom's state
      },
      step: {
        1: {
          agentText: "Tim says hi to you",
          options: [
            {
              text: "Tom, can I have some food",
              nextState: 2,
              agentText: "That's not a good question",
              agentEmotion: "angry",
              oracleText: "Tom is happy you told him your name"
            },
            {
              text: "Hi Tom, my name is %player%",
              nextState: 3,
              agentText: "",
              agentEmotion: "happy"
            },
          ]
        }
        2: {
          agentText: "What are you looking for, %player%?",
          options: [
            {
              text: "I'd like oranges",
              nextState: 4,
              agentText: "Sorry, I don't have that",
              agentEmotion: "sad"
            },
            {
              text: "I'd like bananas",
              nextState: 5,
              agentText: "",
              agentEmotion: "happy"
            },
          ]
        }
      }
    }
  };
  
  my.getAvailableQuests = function(agentStates) {
    return {
      1: {
        questId: 10, // 1 = Tom's agentId, 1 = questId of available quest for Tom
        name: "Tom"
      },
      2: {
        questId: null, // 2 = Amy's agentId, null = no quests for Amy
        name: "Amy"
      }
    }
  };
  