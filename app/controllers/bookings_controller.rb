class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @flight = Flight.find(params[:flight_id])
    @passengers = params[:passengers]

    @passengers.to_i.times { @booking.passengers.build }

  end

  def create
    @booking = Booking.create(flight_id: params[:flight_id])

    users = params[:booking][:passenger]

    users.each do |user|
      @booking.passengers << Passenger.create(name: user[:name], email: user[:email])
    end


    # Passenger.create(name: params[:booking][:passenger][0][:name], email: params[:booking][:passenger][0][:email])

    # test = Booking.create(flight_id: 6)

    # Passenger.create(name: "BMW", email: "piper@BMW.com")
  
    # @booking.passengers << 
    
    # @booking.passengers 

    # Booking.create(flight_id: 1)

    # Passenger.create(name: "Robert", email: "rsuazo@gmail.com")
    # Passenger.create(name: "Tiffany", email: "tsuazo@gmail.com")
    # Passenger.create(name: "Patricia", email: "pringhofer@gmail.com")
    # Passenger.create(name: "Abigail", email: "aringhofer@gmail.com")

    # Booking.find(1).passengers << Passenger.find(1)
    # Booking.find(1).passengers << Passenger.find(2)
    # Booking.find(2).passengers << Passenger.find(3)
    # Booking.find(2).passengers << Passenger.find(4)
  end

  private

  def booking_params
    params.require(:booking).permit(:id, :flight_id, :passenger => [:id, :name, :email], :passenger_attributes => [:id, :name, :email])
  end
end
