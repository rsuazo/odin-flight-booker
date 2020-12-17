require 'sendgrid-ruby'
include SendGrid


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

        from = Email.new(email: 'test@example.com')
        subject = 'Hello World from the SendGrid Ruby Library!'
        to = Email.new(email: 'rsuazo2@gmail.com')
        content = Content.new(type: 'text/plain', value: 'Hello, Email!')
        mail = Mail.new(from, subject, to, content)

        sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
        response = sg.client.mail._('send').post(request_body: mail.to_json)
        puts response.status_code
        puts response.body
        puts response.headers
        # PassengerMailer.with(user: @passenger).welcome_email.deliver_now
      end
      
      
      
      #@booking.passengers << Passenger.create(name: user[:name], email: user[:email])
      
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
