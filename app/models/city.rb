class City < ActiveRecord::Base
  validates :lat, presence: true
  validates :lon, presence: true
  
  before_validation :geocode
  
  before_validation :forecast
  
  private
  
  def geocode
    places = Nominatim.search.city(self.name).limit(1)
    if places.first
      self.lat=places.first.lat
      self.lon=places.first.lon
    end
  end
  
  def forecast
    forecast = ForecastIO.forecast(self.lat, self.lon, params: { units: 'si' })
  end
  
end
