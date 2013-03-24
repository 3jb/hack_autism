Oracle.agents = {};

Oracle.Actions = new function() {
  var my = {};
 
  my.showMap = function() {
    $("#mapCanvas").show();
    $("#canvas").hide();
    Oracle.Map.refresh();
  };
  
  my.showDialog = function() {
    $("#mapCanvas").hide();
    $("#canvas").show();
  };
  
  my.onMapClick = function() {
    var questData = $(this).data("quest");
    console.log(questData);
    Oracle.Quests.getQuest(questData.questId, function(result) {
      Oracle.Dialog.startQuest(result);
      my.showDialog();      
    });
  };
  
  my.findAgent = function(agentId) {
    var agents = $(".agent");
    
    for (var i in agents) {
      if ($(agents[i]).data("agentId") == agentId) {
        return $(agents[i]);
      }
    }
  }

  my.play = function() {
    // some work on setting agent emotion
    Oracle.agents = {
      1: {
        name: "Tom",
        emotionalState: "neutral"
      },
      2: {
        name: "Amy",
        emotionalState: "neutral"
      }
    }
    
    Oracle.Map.render();
    
    // getAvailableQuests
    var quests = Oracle.Quests.getAvailableQuests({
      1: Oracle.agents[1],
      2: Oracle.agents[2],
      }
    );
  
    for (var i in quests) {
      var agent = my.findAgent(i);
      agent.data("quest", quests[i]);
    }
    
    my.showMap();
    
    $("#renderMap").click(function() {
      Oracle.agents[1].emotionalState = "sad";
      my.showMap();
    });
  }

  return my;
}
