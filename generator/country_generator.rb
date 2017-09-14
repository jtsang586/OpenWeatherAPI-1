require 'yaml'

module Generator

    class Random_country_generator

        attr_accessor :countries_all, :country_name, :capital_name, :country_code

        def initialize
            @countries_all = YAML.load_file('countries.yml')
            @country_name = ""
            @capital_name = ""
            @country_code = ""
        end


        def generate_country
            random_number = rand(249)

            @capital_name = @countries_all[random_number]['capital'].delete(' ')

            if @capital_name == ''
                generate_country
            end

            @country_name = @countries_all[random_number]['name']['common']
            @country_code = @countries_all[random_number]['cca2']
        end
    end

end

# generator = Generator::Random_country_generator.new

# generator.generate_country