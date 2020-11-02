class RemovePassengersFromFlights < ActiveRecord::Migration[5.2]
  def change
    remove_column :flights, :passengers, :integer
  end
end
