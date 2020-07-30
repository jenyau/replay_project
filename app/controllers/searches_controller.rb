class SearchesController < ApplicationController
  def show
    @start_station = RailwayStation.find(params[:start_station_id])
    @end_station = RailwayStation.find(params[:end_station_id])

    @routes = @start_station.routes.joins(:railway_stations).where('railway_stations.id = ?', @end_station.id)
  end

  def new
  end

end
