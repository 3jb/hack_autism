

Oracle.Dialog= new function() {
  var my = {};

//  $(document).on("click", ".agent", function() {
//    alert("clicked on agent " + $(this).data("agent-id"));
//  });

  my.startQuest = function(quest) {

    var questData = Oracle.Quests.getQuest(quest.questId);
    my.place(quest.agent, 
	     quest.agent.name + "_L_neutral.png");

       console.log(quest);
    my.renderStep(quest, 1);
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
	  if (value.nextStep < 0) {
	    Oracle.Actions.showMap();
	    return;
	  }
	  console.log(qData);
	  var img_path = qData.agent.name + "_L_";
	  switch (value.response_quality) {
	    case -2: img_path += "mad.png";
		     break;
	    case -1: img_path += "sad.png";
		     break;
	    case 1: img_path += "neutral.png";
		     break;
	    case 2: img_path += "happy.png";
		     break;
	  }
	  $("#agent_img").attr("src", "images/assets/" + img_path);
	  Oracle.Dialog.renderStep(qData, value.nextStep);
       	  }).
	    appendTo(my_options);
    });
    
  };
  
  my.place = function(agent, img_path) {
      $("#canvas").empty();
      my.placeAgent(agent.agentid, img_path, 400, 170);
      my.placePrompt("", 50, 35);
      my.placeOptions([], 50, 170);
  };

  
  my.placeAgent = function(agent_id, image_path, x, y) {
    $("<img>").
      attr("src", "images/assets/" + image_path).
      attr("id", "agent_img").
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
