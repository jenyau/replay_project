class CreateTickets < ActiveRecord::Migration[6.0]
  def change
    create_table :tickets do |t|
      t.string :passenger_name
      t.belongs_to :train, index: true
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
