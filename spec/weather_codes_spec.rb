include WeatherConditions

describe ConditionsCode do

	before(:all) do
		@first_condition = WeatherConditions::ConditionsCode.new("301")
		@second_condition = WeatherConditions::ConditionsCode.new("501")
	end

	it 'should return a string for the description associated with the id' do
		expect(@first_condition.meaning).to be_a String
		expect(@second_condition.meaning).to be_a String
	end

	it 'should return an array of size 0, 1, or 2 for the icon' do
		expect(@first_condition.icon).to be_a Array
		expect(@second_condition.icon).to be_a Array
		expect(@first_condition.icon.length).to be_between(0,2)
		expect(@second_condition.icon.length).to be_between(0,2)
	end

end