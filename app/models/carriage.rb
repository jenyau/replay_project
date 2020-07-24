class Carriage < ApplicationRecord
  belongs_to :train
  before_validation :generate_number
  validate :unique_number

  scope :coupe,   ->{ where(type: 'CoupeCarriage') }
  scope :sv,      ->{ where(type: 'SvCarriage') }
  scope :seats,   ->{ where(type: 'SeatsCarriage') }
  scope :economy, ->{ where(type: 'EconomyCarriage') }
  scope :ordered, ->{ order(:number) }
  scope :desc,    ->{ order("number DESC")}
  private
  def generate_number
    if train.carriages.empty?
      self.number = 1
    else
      self.number = train.carriages.last.number + 1
    end
  end

  def unique_number
    if train.carriages.where(number: self.number).first
      errors.add(:base, "number errors validates")
    end
  end
end