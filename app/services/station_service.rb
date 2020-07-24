class StationService < BaseService

  attr_reader :station, :route, :position

  def initialize(station, route, position)
    @station = station
    @route   = route
    @position = position
  end

  def call
    update_position
  end

  private

  def update_position
    station.railway_stations_routes.find_by(route: route).update(station_position: posotion)
  end
end
