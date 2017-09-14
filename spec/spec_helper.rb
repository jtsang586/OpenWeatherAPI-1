require 'httparty'
require_relative '../weathers.rb'
require_relative '../generator/country_generator.rb'

RSpec.configure do |config|
  config.color = true
  config.formatter = :documentation
end