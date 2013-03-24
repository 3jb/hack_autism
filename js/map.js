var Oracle = {};


Oracle.Map = new function() {
  var my = {};

  my.place = function() {
      var rand_x = 0, rand_y = 0;
      $.each(Oracle.agents, function(i,img) {
	//max x= 530px max_y = 240
	rand_x = 10; rand_y = 10;
        rand_x += Math.ceil(Math.random() * 520);
        rand_y += Math.ceil(Math.random() * 230);
	my.placeAgent(i, img, rand_x, rand_y);});
  };
  my.placeAgent = function(agent_id, image_path, x, y) {
    $("<img>").
      attr("src", "images/" + image_path).
      data("agent-id", agent_id).
      addClass("agent").
      css("left", x).
      css("top", y).
      on("click", Oracle.Actions.onMapClick).
      appendTo($("#canvas"));
  };
  
  return my;
}
