var Oracle = {};


Oracle.Map = new function() {
  var my = {};
  
  my.refresh = function() {
    for (var i in Oracle.agents) {
      var agentData = Oracle.agents[i];
      Oracle.Actions.findAgent(i).attr("src", "images/assets/" + agentData.name + "_S_" + agentData.emotionalState + ".png");
    }
  };
  
  my.render = function() {
    my.createAgent(1, 170, 250);
    my.createAgent(2, 400, 60);
	  
	  my.refresh();
  };

  my.createAgent = function(agent_id, x, y) {
    $("<img>").
      data("agent-id", agent_id).
      addClass("agent").
      css("left", x).
      css("top", y).
      on("click", Oracle.Actions.onMapClick).
      appendTo($("#mapCanvas"));  
  };
  
  return my;
}
