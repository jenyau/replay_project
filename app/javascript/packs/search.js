$(document).ready(function(){
  $("#carriage_seat_places").hide();
  $("#carriage_type").on("change", function(){
    var choice = $(this).val();
    var top_seats = $("#carriage_top_seats");
    var bottom_seats = $("#carriage_bottom_seats");
    var side_top_seats = $("#carriage_side_top_seats");
    var side_bottom_seats = $("#carriage_side_bottom_seats");
    var seat_places = $("#carriage_seat_places");


    switch(choice){
      case "CoupeCarriage":
        top_seats.show();
        bottom_seats.show();
        side_top_seats.hide();
        side_bottom_seats.hide();
        seat_places.hide();
      break
      case "EconomyCarriage":
        top_seats.show();
        bottom_seats.show();
        side_top_seats.show();
        side_bottom_seats.show();
        seat_places.hide();
      break
      case "SvCarriage":
        top_seats.hide();
        bottom_seats.show();
        side_top_seats.hide();
        side_bottom_seats.hide();
        seat_places.hide();
      break
      case "SeatsCarriage":
        top_seats.hide();
        bottom_seats.hide();
        side_top_seats.hide();
        side_bottom_seats.hide();
        seat_places.show();
      break
    };
  });
})