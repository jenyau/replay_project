class Train < ApplicationRecord
  validates :number, presence: true

  belongs_to :route
  has_many :tickets
  has_many :carriages

  scope :ordered, ->{ carriages.order(:number) }

  def total_places(carriage_type, type_places)
    total = 0
    if carriages.where(type: carriage_type).empty?
      return total
    else
      carriages.where(type: carriage_type).each do |car|
        total += car.public_send(type_places.to_sym)
      end
    end
    return total
  end

end
