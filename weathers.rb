require 'json'
require 'httparty'

# Module weathers to contain weather stuff
module Weathers
	# Class to return the current weather a capital city
	class CurrentWeather

		include HTTParty 

		base_uri 'http://api.openweathermap.org/data/2.5'
		# Takes in capital name and country code at the start to find current weather
		def initialize(city_name, country_code)
			@current_weather = self.class.get("/weather?q=#{city_name},#{country_code}&appid=b1d2a3a87decdd84518e3bdddbd5de57")
		end

		def get_single_headers
			@current_weather.headers.inspect
		end

		def get_single_body
			JSON.parse(@current_weather.body)
		end

		def get_single_response_message
			@current_weather.message
		end

		def get_single_response_code
			@current_weather.code
		end

	end

end