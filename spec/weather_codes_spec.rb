include WeatherConditions

describe ConditionsCode do

	before(:all) do
		@first_condition = WeatherConditions::ConditionsCode.new("301")
		@second_condition = WeatherConditions::ConditionsCode.new("301")
	end

	it 'should return a string for the description associated with the id' do
		puts @first_condition.meaning
	end

end