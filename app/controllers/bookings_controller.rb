class BookingsController < ApplicationController
  def new
    @booking = Booking.new

    if params[:flight_id].to_i.positive?
      @flight = Flight.find(params[:flight_id])
    else
      redirect_to flights_path

    end

    if params[:passengers].to_i.positive?
      params[:passengers].to_i.times { @booking.passengers.build }
    else
      @booking.passengers.build
    end
  end

  def create
    @booking = Booking.create(flight_id: params[:flight_id])

    @users = params[:booking][:passenger]

    @users.each do |user|
      @passenger = Passenger.new(name: user[:name], email: user[:email])

      if @passenger.save
        @booking.passengers << @passenger
        @flight = Flight.find(params[:flight_id])
        PassengerMailer.with(user: @passenger, flight: @flight).welcome_email.deliver_now
      end
    end

    redirect_to booking_path(@booking.id)
  end

  def show
    @booking = Booking.find(params[:id])
    @flight = @booking.flight
  end

  private

  def booking_params
    params.require(:booking).permit(:id, :flight_id, passenger: %i[id name email], passenger_attributes: %i[id name email])
  end
end
