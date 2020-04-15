# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Airport.destroy_all
Flight.destroy_all

10.times do
  Airport.create!(code: ('A'..'Z').to_a.shuffle[0..2].join(''))
end

50.times do
  airports = Airport.all
  from = Airport.pluck(:id).shuffle.first
  begin 
    to = Airport.pluck(:id).shuffle.first
  end until to != from
  Flight.create!(to_airport_id: to,
                 from_airport_id: from, 
                 start_time: Time.now + rand(30.days), 
                 duration: rand(500) + 45)
end