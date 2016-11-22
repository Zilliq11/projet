require 'test_helper'

class CityTest < ActiveSupport::TestCase
  setup do
    @city = cities(:one)
    @cityWrong = cities(:two)
  end
  
  test "should create city" do
    VCR.use_cassette("nominatim") do
      assert_difference('City.count') do
        city = City.new  name: @city.name
        city.save
      end
    end
  end
  
  test "should break on unknown city" do
    VCR.use_cassette("nominatim2") do
        city = City.new  name: @cityWrong.name
        city.save
        assert city.invalid?
    end
  end
  
  test 'weather forecast' do 
     VCR.use_cassette("weather") do
       weather = cities(:one).weather
     end
  end
 
end
