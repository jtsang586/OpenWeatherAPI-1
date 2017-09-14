include Weathers
include Generator

describe CurrentWeather do

	before(:all) do
		#Generate random captial city
		@capital_city = Generator::RandomCountryGenerator.new
		puts @captial_city.generate_country
		# @captial_city.generate_country
		#Obtaining weather json object
		# @current_weather = Weathers::CurrentWeather.new(@captial_city.capital_name,@captial_city.country_code).get_single_body
	end

	it 'should return matching country code and city name' do

	end

	it 'should return a weather JSON object with at most 12 main keys' do

	end

	it 'should return coordinates that are a JSON object, with longitude an latitude floats' do

	end

	it 'should return a weather array' do

	end

	it 'should return a JSON object inside the weather array that' do

	end

end