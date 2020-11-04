class BookingIndex < ActiveRecord::Migration[5.2]
  def change
    add_index :passenger, :booking_id
  end
end
