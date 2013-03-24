class ApiController < ApplicationController
  
  def quests
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
