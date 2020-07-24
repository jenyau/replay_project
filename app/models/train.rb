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




        #   if type_places == "top_seats"
      #     total += car.top_seats
      #   elsif type_places == "bottom_seats"
      #     total += car.bottom_seats
      #   elsif type_places == "side_top_seats"
      #     total += car.side_top_seats
      #   elsif type_places == "side_bottom_seats"
      #     total += car.side_bottom_seats
      #   elsif type_places == "seat_places"
      #     total += car.seat_places
      #   else
      #     total = 0
      #   end
      end
    end
    return  total
  end

end
