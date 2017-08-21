class AddForeignKeysToBookings < ActiveRecord::Migration[5.1]
  def change
  	add_reference :bookings, :passenger, foreign_key:true
  	add_reference :bookings, :flight, foreign_key:true
  end
end
