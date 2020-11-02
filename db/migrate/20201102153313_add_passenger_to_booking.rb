class AddPassengerToBooking < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :number_of_passengers, :integer
  end
end
