class Route < ApplicationRecord
  before_validation :generate_name

  has_many :railway_stations_routes
  has_many :railway_stations, through: :railway_stations_routes
  has_many :trains

  scope :station_ordered, ->{joins(:railway_stations_routes).where()}


  validate :stations_count

  private
  def generate_name
    if railway_stations.empty?
      self.name = "Chose railway stations"
    else
      self.name = "#{railway_stations.first.title} - #{railway_stations.last.title}"
    end
  end
  def stations_count
    if railway_stations.size < 2
      errors.add(:base, "Route should contain at least 2 stations")
    end
  end
end
