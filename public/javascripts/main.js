Oracle.agents = {};

Oracle.Actions = new function() {
  var my = {};
 
  my.onMapClick = function() {
    Oracle.Dialog.startQuest($(this).data("quest"));
  };
  
  var findAgent = function(agentId) {
    var agents = $(".agent");
    
    for (var i in agents) {
      if ($(agents[i]).data("agentId") == agentId) {
        return agents[i];
      }
    }
  }

  my.play = function() {
    Oracle.agents = ["mario.png", "sonic.png", "tails.png"];
    
    // some work on setting agent emotion
    // Oracle.agents = {
    //   1: {
    //     name: "Tom",
    //     image: "mario.png"
    //   },
    //   2: {
    //     name: "Amy",
    //     image: "tails.png"
    //   }
    // }
    
    Oracle.Map.place();
    
    // getAvailableQuests
    var quests = Oracle.Quests.getAvailableQuests({
      1: Oracle.agents[1],
      2: Oracle.agents[2],
      }
    );
  
    for (var i in quests) {
      var agent = $(findAgent(i)); 
      agent.data("quest", quests[i]);
    }
  }

  return my;
}
