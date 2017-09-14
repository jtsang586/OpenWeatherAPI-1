include WeatherConditions

describe ConditionsCode do

	before(:all) do
		@first_condition = WeatherConditions::ConditionsCode.new("301")
		@second_condition = WeatherConditions::ConditionsCode.new("501")
	end

	it 'should return a string for the description associated with the id' do
		expect(@first_condition.meaning).to be_a String
	end

end