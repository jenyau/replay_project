class RailwayStation < ApplicationRecord
  validates :title, presence: true

  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes
  scope :ordered, ->{ joins(:railway_stations_routes).order("railway_stations_routes.station_position").uniq }

  def update_time_position(route, arrival_time, departure_time)
   station_route = station_route(route)
    station_route.update(arrival_time: arrival_time)
    station_route.update(departure_time: departure_time)
  end


  def update_position(route, station_position)
   station_route = station_route(route)
    station_route.update(station_position: station_position) if station_route
  end

  def position_in(route)
   station_route = station_route(route)
    station_route.station_position if station_route
  end

  def position_in_arrival_time(route)
    station_route = station_route(route)
    if station_route.present? && station_route.arrival_time.present?
      station_route.arrival_time.strftime("%H:%M")
    else
      return nil
    end
  end

  def position_in_departure_time(route)
    station_route = station_route(route)
    if station_route.present? && station_route.departure_time.present?
      station_route.departure_time.strftime("%H:%M")
    else
      return nil
    end
  end

  private
  def station_route(route)
    railway_stations_routes.find_by(route: route)
  end
end
