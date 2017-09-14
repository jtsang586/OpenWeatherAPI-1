include Weathers

describe CurrentWeather do

	before(:all) do
		#Generate random captial city
		@generator = Generator::RandomCountryGenerator.new
        @generator.generate_country
		#Obtaining weather json object
		@current_weather = Weathers::CurrentWeather.new(@generator.capital_name,@generator.country_code)
	end

	it 'should return matching country code and city name' do
		expect(@current_weather.get_single_body['name']).to eq @generator.capital_name
		expect(@current_weather.get_single_body['sys']['country']).to eq @generator.country_code
	end

	it 'should return a current weather JSON object with at most 13 main keys' do
		expect(@current_weather.get_single_body.keys.length).to be_between(11,13)
	end

	it 'should return coordinates that are a Hash, with longitude an latitude numbers' do
		expect(@current_weather.get_single_body['coord']).to be_a(Hash)
		expect(@current_weather.get_single_body['coord']['lon']).to be_kind_of(Numeric)
		expect(@current_weather.get_single_body['coord']['lat']).to be_kind_of(Numeric)
	end

	it 'should return a weather array' do
		expect(@current_weather.get_single_body['weather']).to be_a(Array)
	end

	it 'should return first hash inside the weather array that has description that matches to their id number' do
		id = @current_weather.get_single_body['weather'][0]['id'].to_s
		condition = WeatherConditions::ConditionsCode.new(id)
		expect(@current_weather.get_single_body['weather'][0]['description']).to eq condition.meaning
	end

	it "should be an integer for id" do 
		expect(@current_weather.get_single_body['id']).to be_kind_of(Integer)
	end

	it "should have 8 digits in id" do 
		expect(@current_weather.get_single_body['id'].size).to equal(8)
	end

	it "should have response code of 200" do 
		expect(@current_weather.get_single_response_code).to equal(200)
	end

	it "Base should be a string" do
		expect(@current_weather.get_single_body['base']).to be_a(String)
	end

	it "Main should be a hash filled with numeric keys" do
		expect(@current_weather.get_single_body['main']['temp']).to be_kind_of(Numeric)
		expect(@current_weather.get_single_body['main']['pressure']).to be_kind_of(Numeric)
		expect(@current_weather.get_single_body['main']['humidity']).to be_kind_of(Numeric)
		expect(@current_weather.get_single_body['main']['temp_min']).to be_kind_of(Numeric)
		expect(@current_weather.get_single_body['main']['temp_max']).to be_kind_of(Numeric)
	end

	it "Wind should be a hash filled with numeric keys" do
		expect(@current_weather.get_single_body['wind']['speed']).to be_kind_of(Numeric)
		expect(@current_weather.get_single_body['wind']['deg']).to be_kind_of(Numeric)
	end

	it "Should get rain hash if exist" do
		if @current_weather.get_single_body.keys.include? 'rain'
			expect(@current_weather.get_single_body['rain']).to be_a(Hash)
		end
	end

	it "Cloud should be hash with all which is an integer" do
		expect(@current_weather.get_single_body['clouds']['all']).to be_a(Integer)
	end	

	it "dt should be 10 digits long" do
		expect(@current_weather.get_single_body['dt'].digits.count).to eq 10
	end	



end