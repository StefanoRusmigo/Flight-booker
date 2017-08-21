class Flight < ApplicationRecord
	belongs_to :departure, class_name:"Airport"
	belongs_to :arrival, class_name:"Airport"
	has_many :bookings
	has_many :passengers, through: :bookings, dependent: :destroy


	def start_date_formated
		flight_time.strftime("%d/%m/%y")
	end

	def start_time_formated
		flight_time.strftime("%H:%M:%S")
	end

	def duration_formated
		h = duration/60
		m = duration%60
		duration_time = "#{h}h #{m}m"
	end
end
