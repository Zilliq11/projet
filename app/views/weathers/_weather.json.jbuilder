json.extract! weather, :id, :name, :lat, :lon, :created_at, :updated_at
json.url weather_url(weather, format: :json)