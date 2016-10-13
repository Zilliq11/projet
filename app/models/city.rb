class City < ActiveRecord::Base
  validates :lat, presence: true
  validates :lon, presence: true
  
  before_validation :geocode
  
  private
  
  def geocode
    places = Nominatim.search.city(self.name).limit(1)
    if places.first
      self.lat=places.first.lat
      self.lon=places.first.lon
    end
    forecast = ForecastIO.forecast(self.lat, self.long, params: { units: 'si' })
    self.summary = self.currently.summary
    self.precipProbability = self.currently.precipProbability
    self.temperature = self.currently.temperature
    self.pressure = self.currently.pressure
  end
end
