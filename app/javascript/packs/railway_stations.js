$(document).on('turbolinks:load', function() {
  $('.edit_station').click(function(event){
    event.preventDefault();
    var station_id;
    var form;
    var railway_station_title;
    var edit_station;

    station_id = $(this).data('station');
    railway_station_title = $(".railway_station_title_" + station_id)
    edit_station = $("#edit_station_id_" + station_id);
    form = $("#form_station_id_" + station_id)

    if(!edit_station.hasClass('super')){
      form.show();
      edit_station.html("hide");
      railway_station_title.hide();
      edit_station.addClass('super');
    } else {
      railway_station_title.show();
      form.hide();
      edit_station.html("Edit");
      edit_station.removeClass('super');
    }
  })
})