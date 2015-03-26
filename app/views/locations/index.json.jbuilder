



=begin
json.query "Unit"
json.suggestions @locations do |location|
  json.value location.name
  json.data location.name
end
=end
