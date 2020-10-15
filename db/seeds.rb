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
Airport.create(code: 'ATH')

Flight.create(from_airport_id: 2, to_airport_id: 1, start_date: 'October 14th 2020', flight_duration: 18000)
Flight.create(from_airport_id: 1, to_airport_id: 4, start_date: 'October 14th 2020', flight_duration: 18000)
Flight.create(from_airport_id: 7, to_airport_id: 8, start_date: 'October 14th 2020', flight_duration: 18000)
Flight.create(from_airport_id: 5, to_airport_id: 4, start_date: 'October 14th 2020', flight_duration: 18000)
Flight.create(from_airport_id: 1, to_airport_id: 3, start_date: 'October 14th 2020', flight_duration: 18000)
Flight.create(from_airport_id: 3, to_airport_id: 6, start_date: 'October 14th 2020', flight_duration: 18000)
Flight.create(from_airport_id: 1, to_airport_id: 9, start_date: 'October 14th 2020', flight_duration: 50400)


Booking.create(flight_id: 1)
Booking.create(flight_id: 1)
Booking.create(flight_id: 2)
Booking.create(flight_id: 3)

Passenger.create(name: "Robert", email: "rsuazo@gmail.com")
Passenger.create(name: "Tiffany", email: "tsuazo@gmail.com")
Passenger.create(name: "Patricia", email: "pringhofer@gmail.com")
Passenger.create(name: "Abigail", email: "aringhofer@gmail.com")

Booking.find(1).passengers << Passenger.find(1)
Booking.find(1).passengers << Passenger.find(2)
Booking.find(2).passengers << Passenger.find(3)
Booking.find(2).passengers << Passenger.find(4)
Booking.find(3).passengers << Passenger.find(3)
Booking.find(3).passengers << Passenger.find(4)
Booking.find(4).passengers << Passenger.find(2)
Booking.find(4).passengers << Passenger.find(3)
