json.extract! city, :id, :name, :lat, :lon, :summary, :precipProbability, :temperature, :pressure, :created_at, :updated_at
json.url city_url(city, format: :json)