

Oracle.Dialog= new function() {
  var my = {};

//  $(document).on("click", ".agent", function() {
//    alert("clicked on agent " + $(this).data("agent-id"));
//  });
  my.place= function(id) {
      $("#canvas").empty();
      my.placeAgent(id, Oracle.agents[id], 520, 170);
      my.placePrompt("Well, hello Issac", 50, 35);
      my.placeOptions(["option_one",
		       "option_two",
		       "option_three"], 50, 170);
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
      html(promptContent).
      addClass("prompt").
      css("left", x).
      css("top", y).
      appendTo($("#canvas"));
  };
  my.placeOptions = function( optArray, x, y) {
    var my_div = $("<div>").
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
