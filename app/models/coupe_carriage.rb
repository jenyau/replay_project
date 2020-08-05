class CoupeCarriage < Carriage
  belongs_to :train

  validates :top_seats, :bottom_seats, presence: true

end