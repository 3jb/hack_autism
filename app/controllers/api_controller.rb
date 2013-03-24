class ApiController < ApplicationController
  
  def quests
    @ws = GoogleSpreadsheet.worksheet("1:1-script")

    steps = {}

    for row in 6..@ws.num_rows
    	step_id = @ws[row,1].to_i
    	
    	step = (steps[step_id] ||= {})
    	step[:options] ||= []

      agentText = @ws[row,2] if !@ws[row,2].blank?

      step[:agentText] = agentText if agentText
      step[:options] << {
      	text: @ws[row,3],
      	response_quality: @ws[row,4].to_i,
      	nextStep: @ws[row,5].to_i,
      	oracleText: @ws[row,6]
      }
    end
    
    render json: {
      agent: {
        name: "Tom",
        agentId: 1
      },
      result: {
        1 => 5,
        2 => 4
      },
      step: steps
    }
  end
  
  def quests2
    render json: {
      agent: {
        name: "Tom",
        agentId: 1
      },
      result: {
        1 => 5,
        2 => 4
      },
      step: {
        1 => {
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
        },
        2 => {
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
  end
end
