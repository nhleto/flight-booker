class Booking < ApplicationRecord
  belongs_to :flight
  has_many :passengers, dependent: :destroy

  accepts_nested_attributes_for :passengers

  # validates :number_of_passengers, length: { minumum: 1, maximum: 9 }
end
