Oracle.Score = new function() {
  var my = {};

  my.place = function() {
      my.placeYay("yay.png", 200, 80);
  };
  my.placeYay = function( image_path, x, y) {
    $("<img>").
      attr("src", "images/" + image_path).
      addClass("yay").
      css("left", x).
      css("top", y).
      appendTo($("#canvas"));
  };
  
  return my;
}
