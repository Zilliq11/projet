class City < ActiveRecord::Base
  validates :lat, presence: true
  validates :lon, presence: true

  before_validation :geocode

  def weather
    forecast = ForecastIO.forecast(self.lat, self.lon, params: { units: 'si' })
    self.summary = forecast.currently.summary
    self.precipProbability = forecast.currently.precipProbability
    self.temperature = forecast.currently.temperature
    self.pressure = forecast.currently.pressure
  end
  
  private

  def geocode
    places = Nominatim.search.city(self.name).limit(1)
    if places.first
      self.lat=places.first.lat
      self.lon=places.first.lon
    end
  end
end
