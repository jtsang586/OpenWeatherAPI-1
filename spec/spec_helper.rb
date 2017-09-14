require 'httparty'
require_relative '../weathers'
require_relative '../generator/country_generator'
require_relative '../weather_conditions/weather_condition_parser'

RSpec.configure do |config|
  config.color = true
  config.formatter = :documentation
end