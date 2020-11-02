class AddBookingIdToFlights < ActiveRecord::Migration[5.2]
  def change
    add_column :flights, :booking_id, :integer
  end
end
