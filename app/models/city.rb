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
    forecast = ForecastIO.forecast(self.lat, self.lon, params: { units: 'si' })
    self.temperature = forecast.currently.temperature
    self.summary = forecast.currently summary
    self.windSpeed = forecast.currently.windSpeed
  end

end
