Oracle.Quests = new function() {
  var my = {};
  
  my.getQuest = function(questId) {
    return {
      agent: {
        name: "Tom",
        agentId: 1
      },
      result: {
        1: 5, // 1 = Tom's agentId. 5 = Tom's state after quest is complete
        2: 4 // 2 = Amy's agentId. 4 = Tom's state
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
        },
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
        questId: 1, // 1 = Tom's agentId, 1 = questId of available quest for Tom
        name: "Tom"
      },
      2: {
        questId: null, // 2 = Amy's agentId, null = no quests for Amy
        name: "Amy"
      }
    }
  };
  
  return my;
}

