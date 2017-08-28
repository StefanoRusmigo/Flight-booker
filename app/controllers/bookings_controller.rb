class BookingsController < ApplicationController
  def new
  	@flight = Flight.find(params[:flight][:flight_id])
  	@passenger_no = params[:passengers].to_i
  	@passenger = Passenger.new
  end

  def create
  	@flight = Flight.find(params[:flight_id])
  	passenger_no = params[:passenger_no].to_i
  	booking = Booking.new

  	passenger_no.times do |n| 
  		booking.passengers.build(booking_params n)
  	end

  	 booking.flight = @flight

  	if booking.save

    booking.passengers.each do |passenger|
        PassengerMailer.thank_you_email(passenger).deliver_now
      end
  	 flash[:alert] = "Your Flight has been booked!"
  	redirect_to booking
  end
  end

  def show
  	@booking = Booking.find(params[:id])
  end

  private
    def booking_params n
    	params.require(:details)[n].permit(:name,:email)
    end
end
