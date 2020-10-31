class Flight < ApplicationRecord
  belongs_to :from_airport, class_name: 'Airport'
  belongs_to :to_airport, class_name: 'Airport'

  def short_time
    time.to_s(:short)
  end
end
