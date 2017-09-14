require 'json'

module WeatherConditions

	class ConditionsCode

		attr_accessor :weather_conditions, :meaning, :icon

		def initialize(id)
			@weather_conditions = JSON.parse(File.read('weather_conditions_codes.json'))
			@meaning = @weather_conditions[id]['meaning']
			@icon = @weather_conditions[id]['icon']
		end

	end

end