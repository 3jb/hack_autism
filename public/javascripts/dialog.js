

Oracle.Dialog= new function() {
  var my = {};

//  $(document).on("click", ".agent", function() {
//    alert("clicked on agent " + $(this).data("agent-id"));
//  });

  my.startQuest = function(quest) {
    my.place(quest.questId);
    
    var questData = Oracle.Quests.getQuest(quest.questId);
    // init quest one
    my.renderStep(questData, 1);
    // on click move to next step
    
  };
  
  my.questFinished = function() {
  
  };
  
  my.renderStep = function(qData, n_step) {
    var step = qData.step[n_step];
    $("#prompt").text(step.agentText);
    var my_options = $("#options").find("ul");
    my_options.empty();
    $.each(step.options, function(index, value) {
      $("<li>").
	html(value.text).
	css("cursor", "pointer").
	on("click", function() {
	  Oracle.Dialog.renderStep(qData, value.nextState);
	}).
	appendTo(my_options);
    });
    
  };
  
  my.place = function(id) {
      $("#canvas").empty();
      my.placeAgent(id, Oracle.agents[id], 520, 170);
      my.placePrompt("", 50, 35);
      my.placeOptions([], 50, 170);
  };

  
  my.placeAgent = function(agent_id, image_path, x, y) {
    $("<img>").
      attr("src", "images/" + image_path).
      data("agent-id", agent_id).
      addClass("agent").
      css("left", x).
      css("top", y).
      appendTo($("#canvas"));
  };

  my.placePrompt = function( promptContent, x, y) {
    $("<div>").
      attr("id", "prompt").
      html(promptContent).
      addClass("prompt").
      css("left", x).
      css("top", y).
      appendTo($("#canvas"));
  };
  my.placeOptions = function( optArray, x, y) {
    var my_div = $("<div>").
      attr("id", "options").
      addClass("prompt").
      css("left", x).
      css("top", y).
      appendTo($("#canvas"));

    var my_list = $("<ul>").
		   addClass("options").
		   css("left", x).
		   css("top", y).
		   appendTo(my_div);
    
    $.each(optArray, function(index, value) {
      $("<li>").
	text(value).
	appendTo(my_list);
    });
  };
  
  return my;
}
