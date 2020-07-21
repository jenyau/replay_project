class Carriage < ApplicationRecord
  belongs_to :train
  before_validation :generate_number

  scope :coupe,   ->{ where(type: 'CoupeCarriage') }
  scope :sv,      ->{ where(type: 'SvCarriage') }
  scope :seats,   ->{ where(type: 'SeatsCarriage') }
  scope :economy, ->{ where(type: 'EconomyCarriage') }

  def generate_number
    if train.carriages.empty?
      self.number = 1
    else
      self.number = train.carriages.last.number + 1
    end
  end
end
