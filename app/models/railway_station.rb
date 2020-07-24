class RailwayStation < ApplicationRecord
  validates :title, presence: true

  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes
  scope :ordered, ->{ joins(:railway_stations_routes).order("railway_stations_routes.station_position").uniq}

  def update_position(route, station_position)
    station_route = railway_stations_routes.find_by(route: route)
    station_route.update(station_position: station_position) if station_route
  end

  def position_in(route)
    station_route = railway_stations_routes.find_by(route: route)
    station_route.station_position if station_route
  end
end
