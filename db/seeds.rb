regions = []

regions.each do |name|
    Region.create(name: name)
end


locations = []

locations.map do |l|
  loc = Location.create(name: l[:name])
  loc.create_stat(lat: l[:lat], latd: l[:latd], long: l[:long], longd: l[:longd], ltype: l[:ltype], cost: l[:cost], fuel: l[:fuel], protection: l[:protection], slips: l[:slips], moorings: l[:moorings])

    l[:regions].each do |r|
      reg = Region.find_by_name(r)
      loc.regions << reg
    end
end
