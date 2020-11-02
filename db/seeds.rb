# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Airport.destroy_all
Flight.destroy_all

airports = %w[JFK DTW SFO LGA SEA]

airports.each { |port| Airport.create(name: port) }

def rand_in_range(from, to)
  rand * (to - from) + from
end

def rand_time(from, to = Time.now)
  Time.at(rand_in_range(from.to_f, to.to_f))
end

def random_hour(from, to)
  (Date.today + rand(from..to).hour + rand(0..60).minutes).to_datetime
end

100.times do
  Flight.create({ from_airport_id: Airport.all.sample.id, to_airport_id: Airport.all.sample.id,
                  start: rand_time(2.days.ago), duration: random_hour(1, 7) })
end

Flight.where('from_airport_id = to_airport_id').delete_all
