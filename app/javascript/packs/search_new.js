$(document).on('turbolinks:load', function() {
  $(".btn").click(function(){
    var start_station;
    var end_station;

    start_station = $('#start_station_id');
    end_station = $('#end_station_id');

    if(start_station.val() == end_station.val()){
      alert("Invalid error");
      return false;
    }
  })
})