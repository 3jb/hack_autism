Oracle.Quests = new function() {
  var my = {};
  
  my.getQuest = function(questId) {
    return {
      result: {
        1: 5, // 1 = Tom's agentId. 5 = Tom's state after quest is complete
        2: 4 // 2 = Amy's agentId. 4 = Tom's state
      },
      states: {
        1: {
          agentText: "Tim says hi to you",
          options: [
            {
              text: "Tom, can I have some food",
              nextState: 2,
              agentText: "That's not a good question",
              agentEmotion: "angry"
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
      1: 1, // 1 = Tom's agentId, 1 = questId of available quest for Tom
      2: null // 2 = Amy's agentId, null = no quests for Amy
    }
  };
  
  return my;
}

