var Oracle = {};


Oracle.Map = new function() {
  var my = {};

  $(document).on("click", ".agent", function() {
    alert("clicked on agent " + $(this).data("agent-id"));
  });
  
  my.placeAgent = function(agent_id, image_path, x, y) {
    $("<img>").
      attr("src", "images/" + image_path).
      data("agent-id", agent_id).
      addClass("agent").
      css("left", x).
      css("top", y).
      appendTo($("#canvas"));
  };
  
  return my;
}