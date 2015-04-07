json.extract! @location, :id, :name, :permalink
  json.lat @location.stat.lat
  json.long  @location.stat.long
  json.ltype  @location.stat.ltype
