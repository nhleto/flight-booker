class Booking < ApplicationRecord
  belongs_to :flights
  belongs_to :passengers

  # validates :number_of_passengers, length: { minumum: 1, maximum: 9 }
end
