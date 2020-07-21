class Train < ApplicationRecord
  validates :number, presence: true

  belongs_to :route
  has_many :tickets
  has_many :carriages
end
