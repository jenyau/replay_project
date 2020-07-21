class AddRouteIdToTrain < ActiveRecord::Migration[6.0]
  def change
    add_belongs_to :trains, :route
  end
end
