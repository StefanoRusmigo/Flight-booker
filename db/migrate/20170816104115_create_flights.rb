class CreateFlights < ActiveRecord::Migration[5.1]
  def change
    create_table :flights do |t|
      t.integer :arrival_id
      t.integer :departure_id
      t.datetime :flight_time
      t.integer :duration

      t.timestamps
    end
  end
end
