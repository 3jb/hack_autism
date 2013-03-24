Oracle.Quests = new function() {
  var my = {};
  
  my.getQuest = function(questId, callback) {
    $.get("/api/quests/" + questId, callback);
  };
  
  my.getAvailableQuests = function(agentStates) {
    return {
      1: {
        questId: 1, // 1 = Tom's agentId, 1 = questId of available quest for Tom
        name: "Tom"
      },
      2: {
        questId: 2, // 2 = Amy's agentId, null = no quests for Amy
        name: "Amy"
      }
    }
  };
  
  return my;
}

