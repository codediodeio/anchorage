# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

regions = ["California", "Pacific Northwest", "Mexico", "South Pacific", "Southern California", "Northern California", "Channel Islands", "Seattle", "Oregon", "Catalina", "Pacific Baja" ]


locations = [
  ["Smugglers Cove", "Channel Islands"],
  ["Newport Harbor", "Southern California"]
 ]

regions.each do |name|
    Region.create(name: name)
end

locations.each do |name, region|
  l = Location.create(name: name)
  l.create_stat
  r = Region.find_by_name(region)
  l.regions << r
end

User.create!(email: "delaneyphx@gmail.com", Figaro.env.admin_pass, admin: true)
