json.extract! @region, :id, :name, :permalink
json.locations @region.locations do |l|
  json.name l.name
  json.permalink l.permalink
  json.ltype l.stat.ltype
end
