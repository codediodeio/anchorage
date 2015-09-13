json.anchorage do
  json.name @location.name
  json.lat @location.stat.lat
  json.lng @location.stat.long
  json.url location_path(@location)
end

json.spots @spots do |spot|
  json.username spot.user.username
  json.lat spot.lat
  json.lng spot.long
end
