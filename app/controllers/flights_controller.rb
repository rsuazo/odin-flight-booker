class FlightsController < ApplicationController
  def index
    @default = 1
    @airport_options = Airport.all.map { |u| [u.code, u.id] }
  
    if params[:start_date]
      @flights = Flight.where(from_airport_id: params[:from_airport], to_airport_id: params[:to_airport], start_date: params[:start_date])
      @default = params[:passengers].to_i
    else
      @flights = Flight.all
    end
  end
end