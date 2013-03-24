Oracle.agents = [];

Oracle.Actions = new function() {
  var my = {};
 
  my.onMapClick = function() {
    Oracle.Dialog.place($(this).data("agent-id"));
  };

  my.play = function() {
    Oracle.agents = ["mario.png", "sonic.png", "tails.png"];
    Oracle.Map.place();
  }

  return my;
}
