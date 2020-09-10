# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Airport.create(code: 'SFO')
Airport.create(code: 'NYC')
Airport.create(code: 'MIA')
Airport.create(code: 'AUS')
Airport.create(code: 'LAX')
Airport.create(code: 'HOU')
Airport.create(code: 'SEA')
Airport.create(code: 'OGG')

Flight.create(from_airport_id: 2, to_airport_id: 1, start_datetime: 'September 10th 2020 06:00:00 AM', flight_duration: 18000)
Flight.create(from_airport_id: 1, to_airport_id: 4, start_datetime: 'September 11th 2020 06:00:00 AM', flight_duration: 18000)
Flight.create(from_airport_id: 7, to_airport_id: 8, start_datetime: 'September 10th 2020 06:00:00 AM', flight_duration: 18000)
Flight.create(from_airport_id: 5, to_airport_id: 4, start_datetime: 'September 11th 2020 06:00:00 AM', flight_duration: 18000)
Flight.create(from_airport_id: 1, to_airport_id: 3, start_datetime: 'September 10th 2020 06:00:00 AM', flight_duration: 18000)
Flight.create(from_airport_id: 3, to_airport_id: 6, start_datetime: 'September 10th 2020 06:00:00 AM', flight_duration: 18000)