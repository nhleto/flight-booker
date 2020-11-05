class AddIndex < ActiveRecord::Migration[5.2]
  def change
    add_column :passengers, :booking_id, :integer
    add_index :passengers, :booking_id
  end
end
