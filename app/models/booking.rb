class Booking < ApplicationRecord
  belongs_to :flight
  belongs_to :passenger

  accepts_nested_attributes_for :passenger

  validates :number_of_passengers, length: { minumum: 1, maximum: 9 }
end
