class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @flight = Flight.find(params[:flight_id])
    @passengers = params[:passengers]

    @passengers.to_i.times { @booking.passengers.build }

  end

  def create
    @booking = Booking.create(flight_id: params[:flight_id])

    @users = params[:booking][:passenger]

    @users.each do |user|
      @booking.passengers << Passenger.create(name: user[:name], email: user[:email])
    end

    redirect_to booking_path(@booking.id)
  end

  def show
    @booking = Booking.find(params[:id])
    @flight = @booking.flight
  end

  private

  def booking_params
    params.require(:booking).permit(:id, :flight_id, :passenger => [:id, :name, :email], :passenger_attributes => [:id, :name, :email])
  end
end