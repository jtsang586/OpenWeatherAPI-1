include Weathers

describe CurrentWeather do

	before(:all) do
        @generator = Generator::RandomCountryGenerator.new
        @generator.generate_country

        @current_weather = Weathers::CurrentWeather.new(@generator.capital_name, @generator.country_code)

	end

	it 'should return the country code and city name' do
	end

	it 'should return a weather JSON object with at most 12 main keys' do

	end

	it 'should return coordinates that are a JSON object, with longitude an latitude floats' do

	end

	it 'should return a weather array' do
	end

	it 'should return a JSON object inside the weather array that' do

	end

	it "should be an integer for id" do 
		expect(@current_weather.get_single_body['id']).to be_kind_of(Integer)
	end

	it "should have 7 digits in id" do 
		expect(@current_weather.get_single_body['id'].size).to equal(8)
	end

	it "should have matching capital city name to return JSON" do 
		expect(@current_weather.get_single_body['name']).to eql(@generator.capital_name)
	end

	it "should have response code of 200" do 
		expect(@current_weather.get_single_response_code).to equal(200)
	end

end