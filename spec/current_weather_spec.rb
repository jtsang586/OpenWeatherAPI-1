include Weathers

describe CurrentWeather do

	before(:all) do
		#Generate random captial city
		@generator = Generator::RandomCountryGenerator.new
        @generator.generate_country
		#Obtaining weather json object
		@current_weather = Weathers::CurrentWeather.new(@generator.capital_name,@generator.country_code).get_single_body
	end

	it 'should return matching country code and city name' do
		expect(@current_weather['name'].delete(' ')).to eq @generator.capital_name
		expect(@current_weather['sys']['country']).to eq @generator.country_code
	end

	it 'should return a current weather JSON object with at most 12 main keys' do
		expect(@current_weather.keys.length).to be_between(11,12)
	end

	it 'should return coordinates that are a Hash, with longitude an latitude floats' do
		expect(@current_weather['coord']).to be_a(Hash)
		expect(@current_weather['coord']['lon']).to be_a(Float)
		expect(@current_weather['coord']['lat']).to be_a(Float)
	end

	it 'should return a weather array' do
		expect(@current_weather['weather']).to be_a(Array)
	end

	it 'should return Hashes inside the weather array that has description that matches to their id number' do

	end

end