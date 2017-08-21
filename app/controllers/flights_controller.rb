class FlightsController < ApplicationController
  def index
  	@airports = Airport.all
  	@airports = @airports.map{|air| air.name}

  	if params[:departure] && params[:arrival]
  		arrival_airport = Airport.find_by(name:params[:arrival])
  		departure_airport = Airport.find_by(name:params[:departure])
  		@flights = Flight.where(arrival:arrival_airport, departure:departure_airport)
  		if @flights.blank?
  			 flash.now[:danger] = "Sorry, there is no such flight"
  		else
  			render :index
  		end
  	end

  end
end
