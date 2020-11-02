class RemoveBookingIdFromFlights < ActiveRecord::Migration[5.2]
  def change
    remove_column :flights, :booking_id, :integer
  end
end
