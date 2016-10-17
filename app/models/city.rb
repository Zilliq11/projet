class City < ActiveRecord::Base
  validates :lat, presence: true
  validates :lon, presence: true

  before_validation :geocode

  def forecast_io
    forecast = ForecastIO.forecast(self.lat, self.lon, params: { units: 'si' })
    results = {}
    results[:summary] = forecast.currently.summary
    results[:precipProbability] = forecast.currently.precipProbability
    results[:temperature] = forecast.currently.temperature
    results[:pressure] = forecast.currently.pressure
    results
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
