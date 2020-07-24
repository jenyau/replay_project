class AddStationPositionToRailwayStationsRoutes < ActiveRecord::Migration[6.0]
  def change
    add_column :railway_stations_routes, :station_position, :integer, index: true
  end
end
