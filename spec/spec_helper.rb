require 'httparty'
require_relative '../weathers'
require_relative '../generator/country_generator'

RSpec.configure do |config|
  config.color = true
  config.formatter = :documentation
end