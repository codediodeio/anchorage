json.locations @locations do |location|
  json.lat location.stat.lat
  json.lng location.stat.long
  json.name location.name
  json.url location_path(location)
end
