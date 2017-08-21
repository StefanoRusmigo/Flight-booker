Airport.delete_all
Flight.delete_all
#Passenger.delete_all

airports = ["London","Amsterdam", "Larnaka", "Athens","Brussels"]

airports.each do |airport|
	Airport.create!(name:airport)
end

def random_airport
	airports = Airport.all.order("RANDOM()").limit(2)
end

def time_rand from = 0.0, to = Time.now
  Time.at(from + rand * (to.to_f - from.to_f))
end

def random_date

time_rand(Time.now,Time.now+1.year).to_datetime
end



100.times do 
airports = random_airport
date = random_date
Flight.create!(departure:airports[0], arrival: airports[1],
			  flight_time:date,duration:rand(100..360))
end