include Generator

describe RandomCountryGenerator do 

    before(:each) do 
        @generator = Generator::RandomCountryGenerator.new
        @generator.generate_country
    end

    it "should return a string for capital_name" do 
        expect(@generator.capital_name).to be_kind_of(String)
    end

    it "should return a string for country_code" do
        expect(@generator.country_code).to be_kind_of(String)
    end

    it "should only have 2 characters in country_code" do 
        expect(@generator.country_code.size).to equal(2)
    end

end