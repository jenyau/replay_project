class Ticket < ApplicationRecord
  validates :passenger_name, presence: true

  belongs_to :train
  belongs_to :user
end
