def seed_regions(hash)
  obj = OpenStruct.new(hash)
  parent = Region.find_or_create_by(name: obj.name)
  obj.subs.each do |name|
    region = Region.find_or_create_by(name: name)
    parent.sub_regions << region
  end
end

super_regions = [
  { name: "North America", subs: ["United States", "Canada", "Caribbean", "Mexico", "Costa Rica", "Guatemala", "Honduras", "Nicaragua", "Panama", "Belize"] },

  { name: "South America", subs: ["Brazil", "Argentina", "Chile", "Colombia", "Ecuador", "Peru", "Uruguay", "Venezuela"] },

  { name: "Asia", subs: ["Brunei", "China", "East Timor", "Hong Kong", "Indonesia", "Japan", "Malaysia", "Myanmar", "Philippines", "Singapore", "South Korea", "Taiwan", "Thailand", "Vietnam"] },

  { name: "Europe", subs: ["Denmark", "Finland", "Netherlands", "Norway", "Sweden", "Croatia", "France", "Cyprus", "Greece", "Italy", "Malta", "Great Britain", "Ireland", "Spain", "Portugal"] },

  { name: "Pacific Islands and Oceania", subs: ["Hawaii", "Federated States of Micronesia", "Guam", "Kiribati", "Marshall Islands", "Northern Marianas", "Palau", "American Samoa", "Australia", "Cook Islands", "Easter Island", "Fiji", "French Polynesia", "Galapagos", "New Caledonia", "New Zealand", "Papua New Guinea", "Samoa", "Tonga", "Vanuatu", "Solomon Islands"] }


]

major_regions = [

  { name: "United States", subs: ["Alaska", "California", "Pacific Northwest", "California", "Atlantic Northeast", "Atlantic Southeast"] },

  { name: "Costa Rica", subs: ["Atlantic Costa Rica", "Pacific Costa Rica"] },

  { name: "Canada", subs: ["British Columbia"] },

  { name: "Mexico", subs: ["Sea of Cortez", "Pacific Mainland Mexico", "Pacific Baja", "Atlantic Mainland Mexico"] },

  { name: "Caribbean", subs: ["Antigua and Barbuda", "Aruba", "Barbados", "Bonaire", "British Virgin Islands", "Cayman Islands", "Curacao", "Dominican Republic", "Guadeloupe", "Martinique", "Montserrat", "Puerto Rico", "Saba", "Sint Maarten", "St Barts", "St Kitts and Nevis", "St Lucia", "Statia", "Trinidad and Tobago", "Turks and Caicos", "US Virgin Islands", "Bahamas", "St Vincent and the Grenadines", "Grenada"] },

  { name: "Hawaii", subs: ["Oahu", "Big Island", "Kauai", "Maui", "Molokai", "Lanai"] },
]

local_regions = [
  { name: "California", subs: ["Channel Islands", "San Diego", "Los Angeles", "Orange County", "San Francisco Bay", "Catalina", "Northern California", "Southern California", "Ventura County"] },

  { name: "Pacific Northwest", subs: ["Washington", "Oregon", "Puget Sound", "San Juan Islands", "Strait of Juan de Fuca"] },

  { name: "Atlantic Northeast", subs: ["New York", "Chesapeake Bay", "Cape Cod", "Maine"] },

  { name: "Atlantic Southeast", subs: ["Florida"] },

  { name: "Sea of Cortez", subs: ["Bahia Concepcion", "Bahia de Los Angeles", "Espiritu Santo", "Isla Carmen", "Isla San Jose", "La Paz", "San Carlos"] },
  { name: "Pacific Mainland Mexico", subs: ["Mazatlan", "Banderas Bay"] },
  { name: "Pacific Baja", subs: ["Mag Bay", "Cabo", "Ensenada"] },

  { name: "British Virgin Islands", subs: ["Tortola", "Jost Van Dyke", "Virgin Gorda"] },
  { name: "US Virgin Islands", subs: ["St Thomas", "St John", "St Croix"] },
  { name: "Bahamas", subs: ["Berry Islands", "Abaco Islands", "New Providence", "Bimini Islands", "Exuma"] },
]

# 1. Major Worldwide Areas
# 2. Countries and Islands
# 3. States and Regionally Significant Areas
# 4. Smallest Regions cities, etc.


super_regions.each { |r| seed_regions(r) }
major_regions.each { |r| seed_regions(r) }
local_regions.each { |r| seed_regions(r) }




# regions = []
#
# regions.each do |name|
#     Region.create(name: name)
# end
#
#

locations = [
{name: 'Marina Pez Vela', regions: ["Costa Rica"], lat: 9.426958, long: -84.168937, ltype: 'Marina', cost: '$2.50 per foot daily', fuel: true, protection: 5, moorings: 0, slips: 100 },
{name: 'Amatique Bay Resort and Marina', regions: ["Guatemala"], lat: 15.747014, long: -88.579811, ltype: 'Marina', cost: 'marina rates', fuel: false, protection: 5, moorings: 0, slips: 35 },
{name: 'La Ceiba Harbor', regions: ["Honduras"], lat: 15.792967, long: -86.761214, ltype: 'Harbor', cost: 'commercial rates', fuel: true, protection: 5, moorings: 0, slips: 0 },
{name: 'Marina Puesta del Sol', regions: ["Nicaragua"], lat: 12.625329, long: -87.341845, ltype: 'Marina', cost: 'marina rates', fuel: true, protection: 5, moorings: 0, slips: 40 },
{name: 'Balboa Yacht Club Moorings', regions: ["Panama"], lat: 8.937188, long: -79.555402, ltype: 'Mooring Field', cost: '$0.70 per foot daily', fuel: true, protection: 4, moorings: 100, slips: 0 },
{name: 'Isla Bonita Yacht Club', regions: ["Belize"], lat: 17.912729, long: -87.967226, ltype: 'Marina', cost: 'resort rates', fuel: true, protection: 4, moorings: 0, slips: 20 },
{name: 'Botafogo Yacht Club Anchorage', regions: ["Brazil"], lat: -22.947943, long: -43.171594, ltype: 'Anchorage', cost: 'yacht club rates', fuel: true, protection: 5, moorings: 75, slips: 0 },
{name: 'Yacht Club Argentino', regions: ["Argentina"], lat: -34.595944, long: -58.362618, ltype: 'Marina', cost: 'yacht club rates', fuel: true, protection: 5, moorings: 15, slips: 30 },
{name: 'Valparaiso Yacht Club', regions: ["Chile"], lat: -33.026377, long: -71.580899, ltype: 'Marina', cost: 'yacht club rates', fuel: false, protection: 5, moorings: 0, slips: 20 },
{name: 'Muelle Turistico Buenaventura', regions: ["Colombia"], lat: 3.888774, long: -77.082378, ltype: 'Destination', cost: 'free', fuel: false, protection: 2, moorings: 0, slips: 0 },
{name: 'Manta Yacht Club', regions: ["Ecuador"], lat: -0.939318, long: -80.720735, ltype: 'Marina', cost: 'yacht club rates', fuel: true, protection: 4, moorings: 25, slips: 0 },
{name: 'Lima Marina Club', regions: ["Peru"], lat: -12.154958, long: -77.026707, ltype: 'Marina', cost: 'marina rates', fuel: true, protection: 5, moorings: 0, slips: 55 },
{name: 'Muelle Puerto del Buceo', regions: ["Uruguay"], lat: -34.908736, long: -56.130275, ltype: 'Marina', cost: 'marina rates', fuel: true, protection: 5, moorings: 0, slips: 40 },
{name: 'Marina Deportiva', regions: ["Venezuela"], lat: 10.614134, long: -67.016497, ltype: 'Marina', cost: 'marina rates', fuel: true, protection: 5, moorings: 0, slips: 75 },
{name: 'Royal Brunei Yacht Club Anchorage', regions: ["Brunei"], lat: 5.001495, long: 115.069128, ltype: 'Anchorage', cost: 'free', fuel: false, protection: 3, moorings: 0, slips: 0 },
{name: 'Baoyang Marina', regions: ["China"], lat: 31.405046, long: 121.509192, ltype: 'Marina', cost: 'marina rates', fuel: true, protection: 5, moorings: 0, slips: 50 },
{name: 'Dili Public Anchorage', regions: ["East Timor"], lat: -8.551762, long: 125.578355, ltype: 'Anchorage', cost: 'free', fuel: false, protection: 3, moorings: 0, slips: 0 },
{name: 'Causeway Bay Typhoon Shelter', regions: ["Hong Kong"], lat: 22.285614, long: 114.184992, ltype: 'Marina', cost: 'marina rates', fuel: true, protection: 5, moorings: 0, slips: 200 },
{name: 'Batavia Marina', regions: ["Indonesia"], lat: -6.119768, long: 106.813548, ltype: 'Marina', cost: 'marina rates', fuel: true, protection: 5, moorings: 0, slips: 60 },
{name: 'Yumenoshima Marina', regions: ["Japan"], lat: 35.652987, long: 139.829093, ltype: 'Marina', cost: 'marina rates', fuel: true, protection: 5, moorings: 0, slips: 180 },
{name: 'Royal Selangor Yacht Club', regions: ["Malaysia"], lat: 3.005396, long: 101.389441, ltype: 'Marina', cost: 'marina rates', fuel: true, protection: 5, moorings: 0, slips: 20 },
{name: 'Asingyi Island', regions: ["Myanmar"], lat: 19.620545, long: 93.615327, ltype: 'Anchorage', cost: 'free', fuel: false, protection: 3, moorings: 0, slips: 0 },
{name: 'Manila Yacht Club Marina', regions: ["Philippines"], lat: 14.561688, long: 120.982387, ltype: 'Marina', cost: 'marina rates', fuel: true, protection: 5, moorings: 0, slips: 20 },
{name: 'Keppel Club Marina', regions: ["Singapore"], lat: 1.265245, long: 103.813063, ltype: 'Marina', cost: 'marina rates', fuel: true, protection: 5, moorings: 0, slips: 65 },
{name: 'Oido Pier', regions: ["South Korea"], lat: 37.34702, long: 126.682802, ltype: 'Destination', cost: 'free', fuel: false, protection: 2, moorings: 0, slips: 0 },
{name: 'Kaohsiung Sailing School', regions: ["Taiwan"], lat: 22.619093, long: 120.269413, ltype: 'Marina', cost: 'marina rates', fuel: false, protection: 5, moorings: 0, slips: 10 },
{name: 'Ko Phi Phi Don South Anchorage', regions: ["Thailand"], lat: 7.735168, long: 98.770247, ltype: 'Anchorage', cost: 'free', fuel: false, protection: 3, moorings: 0, slips: 0 },
{name: 'Ben Pha Cat Lai', regions: ["Vietnam"], lat: 10.752898, long: 106.793362, ltype: 'Marina', cost: 'marina rates', fuel: true, protection: 5, moorings: 0, slips: 10 },
{name: 'Kongelig Dansk Yachtklub', regions: ["Denmark"], lat: 55.726221, long: 12.585374, ltype: 'Marina', cost: 'marina rates', fuel: true, protection: 5, moorings: 0, slips: 25 },
{name: 'Helsingin Marina', regions: ["Finland"], lat: 60.173089, long: 24.964608, ltype: 'Marina', cost: 'marina rates', fuel: true, protection: 5, moorings: 0, slips: 150 },
{name: 'Smarter Yachting Amsterdam', regions: ["Netherlands" ], lat: 52.372301, long: 4.943572, ltype: 'Marina', cost: 'marina rates', fuel: true, protection: 5, moorings: 0, slips: 80 },
{name: 'Nautic Sailing AS Marina', regions: ["Norway"], lat: 60.256435, long: 5.238843, ltype: 'Marina', cost: 'marina rates', fuel: true, protection: 5, moorings: 0, slips: 70 },
{name: 'Gryts Varv and Marina AB', regions: ["Sweden"], lat: 58.160195, long: 16.810015, ltype: 'Marina', cost: 'marina rates', fuel: true, protection: 5, moorings: 0, slips: 90 },
{name: 'Hotel Marinska Kula Marina', regions: ["Croatia"], lat: 43.512661, long: 16.11434, ltype: 'Marina', cost: 'marina rates', fuel: true, protection: 5, moorings: 0, slips: 10 },
{name: 'Port Lympia', regions: ["France"], lat: 43.697513, long: 7.285303, ltype: 'Harbor', cost: 'marina rates', fuel: true, protection: 5, moorings: 0, slips: 1200 },
{name: 'Zygi Marina', regions: ["Cyprus"], lat: 34.726876, long: 33.339072, ltype: 'Marina', cost: 'marina rates', fuel: true, protection: 5, moorings: 0, slips: 30 },
{name: 'Agios Kosmas Marina', regions: ["Greece"], lat: 37.876294, long: 23.728243, ltype: 'Marina', cost: 'marina rates', fuel: true, protection: 5, moorings: 0, slips: 200 },
{name: 'Sud Cantieri Marina', regions: ["Italy"], lat: 40.827085, long: 14.116789, ltype: 'Marina', cost: 'marina rates', fuel: true, protection: 5, moorings: 0, slips: 300 },
{name: 'Small Gains Marina', regions: ["Great Britain"], lat: 51.52087, long: 0.622818, ltype: 'Marina', cost: 'marina rates', fuel: true, protection: 5, moorings: 0, slips: 70 },
{name: 'Malahide Marina', regions: ["Ireland"], lat: 53.455383, long: -6.152735, ltype: 'Marina', cost: 'marina rates', fuel: true, protection: 5, moorings: 75, slips: 200 },
{name: 'Mangrove Bay at Pohnpei ', regions: ["Federated States of Micronesia"], lat: 6.961193, long: 158.200745, ltype: 'Anchorage', cost: 'free', fuel: true, protection: 3, moorings: 0, slips: 0 },
{name: 'Apra Harbor', regions: ["Guam"], lat: 13.450175, long: 144.656648, ltype: 'Harbor', cost: 'marina rates', fuel: true, protection: 5, moorings: 20, slips: 50 },
{name: 'London Lagoon ', regions: ["Kiribati"], lat: 1.983163, long: -157.470857, ltype: 'Anchorage', cost: 'free', fuel: true, protection: 5, moorings: 0, slips: 0 },
{name: 'Port of Majuro', regions: ["Marshall Islands"], lat: 7.067924, long: 171.267231, ltype: 'Harbor', cost: '$25 per vessel permit', fuel: true, protection: 5, moorings: 0, slips: 0 },
{name: 'Smiling Cove Marina', regions: ["Northern Marianas"], lat: 15.217124, long: 145.722334, ltype: 'Anchorage', cost: 'marina rates', fuel: true, protection: 5, moorings: 0, slips: 30 },
{name: 'Royal Belau Yacht Club Anchorage', regions: ["Palau"], lat: 7.339561, long: 134.450513, ltype: 'Anchorage', cost: 'free', fuel: true, protection: 4, moorings: 0, slips: 0 },
{name: 'Pago Pago Harbour', regions: ["American Samoa"], lat: -14.272276, long: -170.697845, ltype: 'Harbor', cost: 'marina rates', fuel: true, protection: 5, moorings: 0, slips: 0 },
{name: 'Sydney Wharf Marina', regions: ["Australia"], lat: -33.865871, long: 151.198133, ltype: 'Marina', cost: 'marina rates', fuel: true, protection: 5, moorings: 0, slips: 54 },
{name: 'Muri Lagoon Anchorage', regions: ["Cook Islands"], lat: -21.257408, long: -159.728854, ltype: 'Anchorage', cost: 'free', fuel: false, protection: 3, moorings: 0, slips: 0 },
{name: 'Hangaroa Harbor', regions: ["Easter Island"], lat: -27.153942, long: -109.439064, ltype: 'Harbor', cost: 'marina rates', fuel: true, protection: 4, moorings: 0, slips: 0 },
{name: 'Royal Suva Yacht Club', regions: ["Fiji"], lat: -18.122469, long: 178.42894, ltype: 'Marina', cost: 'marina rates', fuel: true, protection: 5, moorings: 0, slips: 50 },
{name: 'Marina Taina', regions: ["French Polynesia"], lat: -17.584926, long: -149.616236, ltype: 'Marina', cost: 'marina rates', fuel: true, protection: 5, moorings: 125, slips: 300 },
{name: 'Academy Bay', regions: ["Galapagos"], lat: -0.748854, long: -90.310599, ltype: 'Anchorage', cost: 'free', fuel: true, protection: 4, moorings: 0, slips: 0 },
{name: 'Port Ouenghi', regions: ["New Caledonia"], lat: -21.905132, long: 166.064909, ltype: 'Marina', cost: 'marina rates', fuel: true, protection: 5, moorings: 0, slips: 20 },
{name: 'Royal New Zealand Yacht Squadron', regions: ["New Zealand"], lat: -36.837523, long: 174.745793, ltype: 'Marina', cost: 'marina rates', fuel: true, protection: 5, moorings: 0, slips: 400 },
{name: 'Port of Alotau', regions: ["Papua New Guinea"], lat: -10.312724, long: 150.453972, ltype: 'Harbor', cost: 'marina rates', fuel: true, protection: 5, moorings: 40, slips: 100 },
{name: 'Apia Bay Harbor', regions: ["Samoa"], lat: -13.828208, long: -171.759447, ltype: 'Harbor', cost: 'marina rates', fuel: true, protection: 5, moorings: 0, slips: 0 },
{name: 'Moorings of Tonga', regions: ["Tonga"], lat: -18.656803, long: -173.982401, ltype: 'Mooring Field', cost: 'marina rates', fuel: true, protection: 5, moorings: 90, slips: 0 },
{name: 'Shark Bay Anchorage', regions: ["Vanuatu"], lat: -15.255762, long: 167.149813, ltype: 'Anchorage', cost: 'free', fuel: false, protection: 3, moorings: 0, slips: 0 },
{name: 'Point Cruz Yacht Club', regions: ["Solomon Islands"], lat: -9.429109, long: 159.955015, ltype: 'Marina', cost: 'yacht club rates', fuel: true, protection: 5, moorings: 0, slips: 0 },
{name: 'Xemxija Bay Anchorage', regions: ["Malta"], lat: 35.94719, long: 14.386239, ltype: 'Anchorage', cost: 'free', fuel: true, protection: 4, moorings: 0, slips: 0 },
{name: 'Ko Olina Marina', regions: ["Hawaii", "Oahu"], lat: 21.328572, long: -158.119319, ltype: 'Marina', cost: '$2.50 per foot per day', fuel: true, protection: 5, moorings: 0, slips: 330 },
{name: 'Ala Wai Harbor Marina', regions: ["Hawaii", "Oahu"], lat: 21.286459, long: -157.841313, ltype: 'Marina', cost: 'marina rates', fuel: true, protection: 5, moorings: 0, slips: 699 },
{name: 'Keehi Marine Center', regions: ["Hawaii", "Oahu"], lat: 21.320513, long: -157.893858, ltype: 'Marina', cost: 'marina rates', fuel: true, protection: 5, moorings: 0, slips: 136 },
{name: 'Keehi Lagoon Offshore Mooring', regions: ["Hawaii", "Oahu"], lat: 21.31882, long: -157.895453, ltype: 'Mooring Field', cost: 'marina rates', fuel: true, protection: 5, moorings: 220, slips: 0 },
{name: 'Pokai Bay', regions: ["Hawaii", "Oahu"], lat: 21.443259, long: -158.19068, ltype: 'Anchorage', cost: 'free', fuel: false, protection: 3, moorings: 0, slips: 0 },
{name: 'Waikiki Beach Anchorage', regions: ["Hawaii", "Oahu"], lat: 21.276132, long: -157.828879, ltype: 'Anchorage', cost: 'free', fuel: false, protection: 2, moorings: 0, slips: 0 },
{name: 'Kewalo Basin Park', regions: ["Hawaii", "Oahu"], lat: 21.288007, long: -157.848896, ltype: 'Anchorage', cost: 'free', fuel: false, protection: 3, moorings: 0, slips: 0 },
{name: 'Kaneohe Bay Offshore Moorings', regions: ["Hawaii", "Oahu"], lat: 21.442207, long: -157.803493, ltype: 'Mooring Field', cost: 'marina rates', fuel: true, protection: 4, moorings: 100, slips: 0 },
{name: 'Haena Bay', regions: ["Hawaii", "Kauai"], lat: 22.222464, long: -159.56558, ltype: 'Anchorage', cost: 'free', fuel: false, protection: 3, moorings: 0, slips: 0 },
{name: 'Port Allen Marina', regions: ["Hawaii", "Kauai"], lat: 21.901636, long: -159.589601, ltype: 'Marina', cost: 'marina rates', fuel: true, protection: 5, moorings: 0, slips: 36 },
{name: 'Nawiliwili Small Boat Harbor ', regions: ["Hawaii", "Kauai"], lat: 21.949847, long: -159.359421, ltype: 'Marina', cost: 'marina rates', fuel: true, protection: 5, moorings: 0, slips: 82 },
{name: 'Kukuiula Small Boat Harbor ', regions: ["Hawaii", "Kauai"], lat: 21.88476, long: -159.487825, ltype: 'Marina', cost: 'marina rates', fuel: false, protection: 4, moorings: 15, slips: 2 },
{name: 'Hanalei Bay', regions: ["Hawaii", "Kauai"], lat: 22.20495, long: -159.503293, ltype: 'Anchorage', cost: 'free', fuel: false, protection: 3, moorings: 0, slips: 0 },
{name: 'Waikaea Canal', regions: ["Hawaii", "Kauai"], lat: 22.071728, long: -159.316811, ltype: 'Anchorage', cost: 'free', fuel: false, protection: 3, moorings: 0, slips: 0 },
{name: 'Anini Beach Park ', regions: ["Hawaii", "Kauai"], lat: 22.223608, long: -159.463213, ltype: 'Anchorage', cost: 'free', fuel: false, protection: 3, moorings: 0, slips: 0 },
{name: 'Honokohau Small Boat Harbor ', regions: ["Hawaii", "Big Island"], lat: 19.669095, long: -156.023017, ltype: 'Marina', cost: 'marina rates', fuel: false, protection: 3, moorings: 0, slips: 262 },
{name: 'Wailoa Sampan Basin and Boat Harbor', regions: ["Hawaii", "Big Island"], lat: 19.72304, long: -155.070485, ltype: 'Marina', cost: 'marina rates', fuel: false, protection: 3, moorings: 0, slips: 25 },
{name: 'Honomalino Bay', regions: ["Hawaii", "Big Island"], lat: 19.168433, long: -155.909077, ltype: 'Anchorage', cost: 'free', fuel: false, protection: 3, moorings: 0, slips: 0 },
{name: 'Kauhako Bay', regions: ["Hawaii", "Big Island"], lat: 19.378455, long: -155.898442, ltype: 'Anchorage', cost: 'free', fuel: false, protection: 3, moorings: 0, slips: 0 },
{name: 'Lahaina Marina', regions: ["Hawaii", "Maui"], lat: 20.870414, long: -156.678056, ltype: 'Marina', cost: 'marina rates', fuel: true, protection: 5, moorings: 83, slips: 16 },
{name: 'Maalaea Marina', regions: ["Hawaii", "Maui"], lat: 20.790881, long: -156.512915, ltype: 'Marina', cost: 'marina rates', fuel: true, protection: 5, moorings: 0, slips: 89 },
{name: 'Hana Wharf', regions: ["Hawaii", "Maui"], lat: 20.756508, long: -155.982555, ltype: 'Anchorage', cost: 'free', fuel: false, protection: 2, moorings: 0, slips: 0 },
{name: 'Kaanapali Beach', regions: ["Hawaii", "Maui"], lat: 20.925999, long: -156.696017, ltype: 'Anchorage', cost: 'free', fuel: false, protection: 2, moorings: 0, slips: 0 },
{name: 'Mala Anchorage', regions: ["Hawaii", "Maui"], lat: 20.889594, long: -156.687527, ltype: 'Anchorage', cost: 'free', fuel: false, protection: 3, moorings: 0, slips: 0 },
{name: 'Kahei Beach', regions: ["Hawaii", "Maui"], lat: 20.721665, long: -156.449312, ltype: 'Anchorage', cost: 'free', fuel: false, protection: 2, moorings: 0, slips: 0 },
{name: 'Manele Marina', regions: ["Hawaii", "Lanai"], lat: 20.742295, long: -156.887644, ltype: 'Marina', cost: 'marina rates', fuel: true, protection: 5, moorings: 0, slips: 24 },
{name: 'Manele Bay Anchorage', regions: ["Hawaii", "Lanai"], lat: 20.741675, long: -156.885684, ltype: 'Anchorage', cost: 'free', fuel: true, protection: 2, moorings: 0, slips: 0 },
{name: 'Kaunakakai Marina', regions: ["Hawaii", "Molokai"], lat: 20.790992, long: -156.512593, ltype: 'Marina', cost: 'marina rates', fuel: true, protection: 5, moorings: 0, slips: 45 },
{name: 'Chelsea Pier Marina', regions: ["Atlantic Northeast", "New York"], lat: 40.748354, long: -74.011057, ltype: 'Marina', cost: '$5.50 per foot Per night', fuel: true, protection: 5, moorings: 0, slips: 200 },
{name: 'Liberty Landing Marina', regions: ["Atlantic Northeast", "New York"], lat: 40.710482, long: -74.039489, ltype: 'Marina', cost: '$4.00 per ft', fuel: true, protection: 5, moorings: 0, slips: 520 },
{name: 'Marine Basin Marina', regions: ["Atlantic Northeast", "New York"], lat: 40.587304, long: -73.998738, ltype: 'Marina', cost: 'marina rates', fuel: true, protection: 5, moorings: 0, slips: 225 },
{name: 'Gateway Marina', regions: ["Atlantic Northeast", "New York"], lat: 40.586097, long: -73.900531, ltype: 'Marina', cost: 'marina rates', fuel: true, protection: 5, moorings: 0, slips: 500 },
{name: 'Mansion Marina', regions: ["Atlantic Northeast", "New York"], lat: 40.543496, long: -74.138173, ltype: 'Marina', cost: 'marina rates', fuel: true, protection: 5, moorings: 0, slips: 217 },
{name: 'York River Yacht Haven', regions: ["Atlantic Northeast", "Chesapeake Bay"], lat: 37.256134, long: -76.479229, ltype: 'Marina', cost: 'marina rates', fuel: true, protection: 5, moorings: 0, slips: 325 },
{name: 'Bodkin Creek', regions: ["Atlantic Northeast", "Chesapeake Bay"], lat: 39.130107, long: -76.442362, ltype: 'Anchorage', cost: 'free', fuel: false, protection: 3, moorings: 0, slips: 0 },
{name: 'Eagle Cove', regions: ["Atlantic Northeast", "Chesapeake Bay"], lat: 39.085448, long: -76.425669, ltype: 'Anchorage', cost: 'free', fuel: false, protection: 4, moorings: 0, slips: 0 },
{name: 'Cacaway Island', regions: ["Atlantic Northeast", "Chesapeake Bay"], lat: 39.12373, long: -76.163802, ltype: 'Anchorage', cost: 'free', fuel: false, protection: 2, moorings: 0, slips: 0 },
{name: 'Corsica River', regions: ["Atlantic Northeast", "Chesapeake Bay"], lat: 39.082577, long: -76.126096, ltype: 'Anchorage', cost: 'free', fuel: false, protection: 3, moorings: 0, slips: 0 },
{name: 'Fairlee Creek', regions: ["Atlantic Northeast", "Chesapeake Bay"], lat: 39.262712, long: -76.207888, ltype: 'Anchorage', cost: 'free', fuel: false, protection: 4, moorings: 0, slips: 0 },
{name: 'Havre de Grace', regions: ["Atlantic Northeast", "Chesapeake Bay"], lat: 39.536389, long: -76.093479, ltype: 'Anchorage', cost: 'free', fuel: false, protection: 3, moorings: 0, slips: 0 },
{name: 'Rockhall Harbor', regions: ["Atlantic Northeast", "Chesapeake Bay"], lat: 39.132491, long: -76.245616, ltype: 'Anchorage', cost: 'free', fuel: true, protection: 4, moorings: 0, slips: 0 },
{name: 'Bohemia River', regions: ["Atlantic Northeast", "Chesapeake Bay"], lat: 39.484751, long: -75.897829, ltype: 'Anchorage', cost: 'free', fuel: true, protection: 3, moorings: 0, slips: 0 },
{name: 'Plymouth Harbor', regions: ["Atlantic Northeast", "Chesapeake Bay"], lat: 41.961914, long: -70.660211, ltype: 'Anchorage', cost: 'free', fuel: true, protection: 4, moorings: 0, slips: 0 },
{name: 'Goldsborough Creek', regions: ["Atlantic Northeast", "Chesapeake Bay"], lat: 38.694982, long: -76.139415, ltype: 'Anchorage', cost: 'free', fuel: false, protection: 3, moorings: 0, slips: 0 },
{name: 'Martin Point Anchorage', regions: ["Atlantic Northeast", "Chesapeake Bay"], lat: 38.632298, long: -76.118331, ltype: 'Anchorage', cost: 'free', fuel: false, protection: 4, moorings: 0, slips: 0 },
{name: 'Shaw Bay', regions: ["Atlantic Northeast", "Chesapeake Bay"], lat: 38.854919, long: -76.184463, ltype: 'Anchorage', cost: 'free', fuel: false, protection: 4, moorings: 0, slips: 0 },
{name: 'Horn Harbor', regions: ["Atlantic Northeast", "Chesapeake Bay"], lat: 37.856855, long: -76.345327, ltype: 'Anchorage', cost: 'free', fuel: false, protection: 3, moorings: 0, slips: 0 },
{name: 'Indian River', regions: ["Atlantic Northeast", "Chesapeake Bay"], lat: 37.979834, long: -76.023327, ltype: 'Anchorage', cost: 'free', fuel: false, protection: 4, moorings: 0, slips: 0 },
{name: 'Sandy Point', regions: ["Atlantic Northeast", "Chesapeake Bay"], lat: 39.031446, long: -76.403118, ltype: 'Anchorage', cost: 'free', fuel: false, protection: 4, moorings: 0, slips: 0 },
{name: 'Solomons Island', regions: ["Atlantic Northeast", "Chesapeake Bay"], lat: 38.331185, long: -76.458792, ltype: 'Harbor', cost: 'marina rates', fuel: true, protection: 5, moorings: 0, slips: 0 },
{name: 'Cuttyhunk Island', regions: ["Atlantic Northeast", "Cape Cod"], lat: 41.426078, long: -70.927454, ltype: 'Anchorage', cost: 'free', fuel: false, protection: 4, moorings: 0, slips: 0 },
{name: 'Menemsha Pond', regions: ["Atlantic Northeast", "Cape Cod"], lat: 41.342707, long: -70.783232, ltype: 'Anchorage', cost: 'free', fuel: true, protection: 4, moorings: 0, slips: 0 },
{name: 'Lake Tashmoo', regions: ["Atlantic Northeast", "Cape Cod"], lat: 41.463005, long: -70.625849, ltype: 'Anchorage', cost: 'free', fuel: true, protection: 4, moorings: 0, slips: 0 },
{name: 'Vinyard Haven Harbor', regions: ["Atlantic Northeast", "Cape Cod"], lat: 41.457429, long: -70.598185, ltype: 'Anchorage', cost: 'free', fuel: true, protection: 4, moorings: 0, slips: 0 },
{name: 'Oak Bluffs', regions: ["Atlantic Northeast", "Cape Cod"], lat: 41.459574, long: -70.559768, ltype: 'Mooring Field', cost: '$40 per day', fuel: true, protection: 5, moorings: 0, slips: 0 },
{name: 'Nantucket Sound', regions: ["Atlantic Northeast", "Cape Cod"], lat: 41.283595, long: -70.089592, ltype: 'Anchorage', cost: 'free', fuel: true, protection: 4, moorings: 0, slips: 0 },
{name: 'Hyannis', regions: ["Atlantic Northeast", "Cape Cod"], lat: 41.63961, long: -70.274079, ltype: 'Anchorage', cost: 'free', fuel: true, protection: 4, moorings: 0, slips: 0 },
{name: 'Stage Harbor', regions: ["Atlantic Northeast", "Cape Cod"], lat: 41.66552, long: -69.971272, ltype: 'Anchorage', cost: 'free', fuel: true, protection: 4, moorings: 0, slips: 0 },
{name: 'Oyster Pond', regions: ["Atlantic Northeast", "Cape Cod"], lat: 41.679399, long: -69.964933, ltype: 'Anchorage', cost: 'free', fuel: true, protection: 4, moorings: 0, slips: 0 },
{name: 'Provincetown Harbor', regions: ["Atlantic Northeast", "Cape Cod"], lat: 42.045886, long: -70.185184, ltype: 'Anchorage', cost: 'free', fuel: true, protection: 4, moorings: 0, slips: 0 },
{name: 'Jones River Anchorage', regions: ["Atlantic Northeast", "Cape Cod"], lat: 41.998197, long: -70.709325, ltype: 'Anchorage', cost: 'free', fuel: true, protection: 3, moorings: 0, slips: 0 },
{name: 'Rockland Harbor Anchorage', regions: ["Atlantic Northeast", "Maine"], lat: 44.101285, long: -69.100927, ltype: 'Anchorage', cost: 'free', fuel: true, protection: 4, moorings: 0, slips: 0 },
{name: 'Burnt Coat Harbor Moorings', regions: ["Atlantic Northeast", "Maine"], lat: 44.143076, long: -68.448047, ltype: 'Mooring Field', cost: '$20 per night', fuel: true, protection: 4, moorings: 30, slips: 0 },
{name: 'Northeast Harbor Maine', regions: ["Atlantic Northeast", "Maine"], lat: 44.296525, long: -68.282446, ltype: 'Harbor', cost: 'marina rates', fuel: true, protection: 4, moorings: 0, slips: 0 },
{name: 'Blue Hill Desert Narrows', regions: ["Atlantic Northeast", "Maine"], lat: 44.408691, long: -68.568707, ltype: 'Anchorage', cost: 'free', fuel: false, protection: 4, moorings: 0, slips: 0 },
{name: 'Frigate Bay South Penrose Island', regions: ["Canada", "British Columbia"], lat: 51.466413, long: -127.717169, ltype: 'Anchorage', cost: 'free', fuel: false, protection: 3, moorings: 0, slips: 0 },
{name: 'Magee Channel', regions: ["Canada", "British Columbia"], lat: 51.489966, long: -127.662305, ltype: 'Anchorage', cost: 'free', fuel: false, protection: 3, moorings: 0, slips: 0 },
{name: 'Fury Cove', regions: ["Canada", "British Columbia"], lat: 51.484722, long: -127.749772, ltype: 'Anchorage', cost: 'free', fuel: false, protection: 3, moorings: 0, slips: 0 },
{name: 'Pierce Bay', regions: ["Canada", "British Columbia"], lat: 51.526549, long: -127.76944, ltype: 'Anchorage', cost: 'free', fuel: false, protection: 4, moorings: 0, slips: 0 },
{name: 'Fish Egg Inlet', regions: ["Canada", "British Columbia"], lat: 51.598056, long: -127.82024, ltype: 'Anchorage', cost: 'free', fuel: false, protection: 3, moorings: 0, slips: 0 },
{name: 'Illahie Inlet', regions: ["Canada", "British Columbia"], lat: 51.650375, long: -127.825993, ltype: 'Anchorage', cost: 'free', fuel: false, protection: 3, moorings: 0, slips: 0 },
{name: 'Spitfire Channel', regions: ["Canada", "British Columbia"], lat: 51.863977, long: -128.183712, ltype: 'Anchorage', cost: 'free', fuel: false, protection: 4, moorings: 0, slips: 0 },
{name: 'Boswell Inlet Coves', regions: ["Canada", "British Columbia"], lat: 51.368508, long: -127.432993, ltype: 'Anchorage', cost: 'free', fuel: false, protection: 3, moorings: 0, slips: 0 },
{name: 'Hot Spings Cove', regions: ["Canada", "British Columbia"], lat: 49.367527, long: -126.263624, ltype: 'Anchorage', cost: 'free', fuel: false, protection: 3, moorings: 0, slips: 0 },
{name: 'Tenedos Bay Desolation Sound', regions: ["Canada", "British Columbia"], lat: 50.126728, long: -124.703808, ltype: 'Anchorage', cost: 'free', fuel: false, protection: 4, moorings: 0, slips: 0 },
{name: 'Refuge Cove', regions: ["Canada", "British Columbia"], lat: 50.124304, long: -124.842607, ltype: 'Anchorage', cost: 'free', fuel: false, protection: 3, moorings: 0, slips: 0 },
{name: 'Gorge Harbour', regions: ["Canada", "British Columbia"], lat: 50.099644, long: -125.027042, ltype: 'Anchorage', cost: 'free', fuel: false, protection: 4, moorings: 0, slips: 0 },
{name: 'Heriot Bay', regions: ["Canada", "British Columbia"], lat: 50.095355, long: -125.198271, ltype: 'Anchorage', cost: 'free', fuel: false, protection: 3, moorings: 0, slips: 0 },
{name: 'Oak Bay Marina', regions: ["Canada", "British Columbia"], lat: 48.425382, long: -123.301664, ltype: 'Marina', cost: '$12.50 per foot monthly', fuel: true, protection: 5, moorings: 0, slips: 220 },
{name: 'Bayshore West Marina', regions: ["Canada", "British Columbia"], lat: 49.293727, long: -123.130869, ltype: 'Marina', cost: '$1250 flat per month', fuel: false, protection: 5, moorings: 0, slips: 100 },
{name: 'Montague Harbour', regions: ["Canada", "British Columbia"], lat: 48.890063, long: -123.391662, ltype: 'Anchorage', cost: 'free', fuel: false, protection: 4, moorings: 0, slips: 0 },
{name: 'Marina Chac Chi', regions: ["Atlantic Mexico"], lat: 21.151117, long: -127.432993, ltype: 'Marina', cost: 'marina rates', fuel: true, protection: 5, moorings: 0, slips: 45 },
{name: 'Sea Isle Marina & Yachting Center', regions: ["Atlantic Southeast", "Florida"], lat: 25.790859, long: -80.184881, ltype: 'Marina', cost: '$35.00 per foot monthly', fuel: true, protection: 5, moorings: 0, slips: 275 },
{name: 'Virginia Key Anchorage', regions: ["Atlantic Southeast", "Florida"], lat: 25.737481, long: -80.170315, ltype: 'Anchorage', cost: 'free', fuel: false, protection: 2, moorings: 0, slips: 0 },
{name: 'Dinner Key Mooring Field', regions: ["Atlantic Southeast", "Florida"], lat: 25.722006, long: -80.230431, ltype: 'Mooring Field', cost: 'marina rates', fuel: false, protection: 4, moorings: 0, slips: 0 },
{name: 'Key Biscayne Anchorage', regions: ["Atlantic Southeast", "Florida"], lat: 25.69411, long: -80.175395, ltype: 'Anchorage', cost: 'free', fuel: false, protection: 3, moorings: 0, slips: 0 },
{name: 'No Name Harbor Anchorage', regions: ["Atlantic Southeast", "Florida"], lat: 25.676444, long: -80.162489, ltype: 'Anchorage', cost: 'free', fuel: false, protection: 4, moorings: 0, slips: 0 },
{name: 'Southern Pumpkin Key Anchorage', regions: ["Atlantic Southeast", "Florida"], lat: 25.323903, long: -80.294933, ltype: 'Anchorage', cost: 'free', fuel: false, protection: 3, moorings: 0, slips: 0 },
{name: 'Fort Bay Harbor Saba', regions: ["Saba"], lat: 17.616407, long: -63.251855, ltype: 'Mooring Field', cost: '$20 per night', fuel: false, protection: 3, moorings: 0, slips: 0 },
{name: 'Saba National Mooring Field', regions: ["Saba"], lat: 17.634802, long: -63.255845, ltype: 'Mooring Field', cost: '$20 per night', fuel: false, protection: 3, moorings: 0, slips: 0 },
{name: 'Hostal Marina Real', regions: ["Dominican Republic"], lat: 18.47744, long: -69.879624, ltype: 'Marina', cost: 'marina rates', fuel: true, protection: 5, moorings: 0, slips: 30 },
{name: 'Marina ZarPar', regions: ["Dominican Republic"], lat: 18.444138, long: -69.626638, ltype: 'Marina', cost: 'marina rates', fuel: false, protection: 5, moorings: 0, slips: 220 },
{name: 'Cabo Rojo Anchorage', regions: ["Dominican Republic"], lat: 17.910912, long: -71.664208, ltype: 'Anchorage', cost: 'free', fuel: false, protection: 3, moorings: 0, slips: 0 },
{name: 'Bahia las Aguillas', regions: ["Dominican Republic"], lat: 17.819826, long: -71.640307, ltype: 'Anchorage', cost: 'free', fuel: false, protection: 3, moorings: 0, slips: 0 },
{name: 'Isla Beata Anchorage', regions: ["Dominican Republic"], lat: 17.588385, long: -71.481854, ltype: 'Anchorage', cost: 'free', fuel: false, protection: 3, moorings: 0, slips: 0 },
{name: 'Bahia de Las Calderas', regions: ["Dominican Republic"], lat: 18.215179, long: -70.543296, ltype: 'Anchorage', cost: 'free', fuel: false, protection: 4, moorings: 0, slips: 0 },
{name: 'Boca Chica Anchorage', regions: ["Dominican Republic"], lat: 18.443532, long: -69.617611, ltype: 'Anchorage', cost: 'free', fuel: false, protection: 3, moorings: 0, slips: 0 },
{name: 'Cumayasa River', regions: ["Dominican Republic"], lat: 18.395866, long: -69.083896, ltype: 'Anchorage', cost: 'free', fuel: false, protection: 3, moorings: 0, slips: 0 },
{name: 'Cayo Levantado', regions: ["Dominican Republic"], lat: 19.168169, long: -71.481854, ltype: 'Anchorage', cost: 'free', fuel: false, protection: 2, moorings: 0, slips: 0 },
{name: 'Bahia Rincon   ', regions: ["Dominican Republic"], lat: 19.287674, long: -69.218276, ltype: 'Anchorage', cost: 'free', fuel: false, protection: 2, moorings: 0, slips: 0 },
{name: 'La Caleta Mooring Field', regions: ["Spain"], lat: 36.531705, long: -6.307246, ltype: 'Mooring Field', cost: 'marina rates', fuel: true, protection: 4, moorings: 150, slips: 0 },
{name: 'Puerto de Barcelona', regions: ["Spain"], lat: 41.376398, long: 2.181628, ltype: 'Harbor', cost: 'marina rates', fuel: true, protection: 5, moorings: 0, slips: 1800 },
{name: 'Marina de Cascais', regions: ["Portugal"], lat: 38.692866, long: -9.416979, ltype: 'Marina', cost: 'marina rates', fuel: true, protection: 5, moorings: 0, slips: 300 },
{name: 'Marina De Portimão', regions: ["Portugal"], lat: 37.12041, long: -8.527755, ltype: 'Marina', cost: 'marina rates', fuel: true, protection: 5, moorings: 0, slips: 240 },
{name: 'Marina di Torregrande - Oristano', regions: ["Italy"], lat: 39.90364, long: 8.491284, ltype: 'Marina', cost: 'marina rates', fuel: true, protection: 5, moorings: 0, slips: 400 },
{name: 'Marina La Spezia', regions: ["Italy"], lat: 44.098906, long: 9.829714, ltype: 'Marina', cost: 'marina rates', fuel: true, protection: 5, moorings: 0, slips: 315 },
{name: 'Santa Margherita Ligure Moorings', regions: ["Italy"], lat: 44.33238, long: 9.215755, ltype: 'Mooring Field', cost: 'marina rates', fuel: true, protection: 4, moorings: 55, slips: 0 },
{name: 'Brodick Moorings', regions: ["Great Britain"], lat: 55.707395, long: -5.294231, ltype: 'Mooring Field', cost: 'marina rates', fuel: true, protection: 4, moorings: 0, slips: 100 },
{name: 'Carradale Anchorage', regions: ["Great Britain"], lat: 55.59349, long: -5.464841, ltype: 'Anchorage', cost: 'free', fuel: true, protection: 3, moorings: 0, slips: 0 },
{name: 'Ardoran Moorings', regions: ["Great Britain"], lat: 56.356516, long: -5.495979, ltype: 'Mooring Field', cost: 'marina rates', fuel: true, protection: 4, moorings: 40, slips: 0 },
{name: 'Lower Diabaig Anchorage', regions: ["Great Britain"], lat: 57.573937, long: -5.685414, ltype: 'Anchorage', cost: 'free', fuel: true, protection: 3, moorings: 0, slips: 0 },
{name: 'Humber Cruising Association', regions: ["Great Britain"], lat: 53.577926, long: -0.067669, ltype: 'Marina', cost: 'marina rates', fuel: true, protection: 5, moorings: 0, slips: 275 },
{name: 'Benner Bay Moorings', regions: ["US Virgin Islands", "St Thomas"], lat: 18.316549, long: -64.867838, ltype: 'Mooring Field', cost: 'marina rates', fuel: true, protection: 4, moorings: 80, slips: 0 },
{name: 'Charlotte Amalie Anchorage', regions: ["US Virgin Islands", "St Thomas"], lat: 18.336414, long: -64.928245, ltype: 'Anchorage', cost: 'free', fuel: false, protection: 3, moorings: 0, slips: 0 },
{name: 'Cowpet Bay Anchorage', regions: ["US Virgin Islands", "St Thomas"], lat: 18.315617, long: -64.843465, ltype: 'Anchorage', cost: 'free', fuel: true, protection: 3, moorings: 0, slips: 0 },
{name: 'Walter Bay USVI', regions: ["US Virgin Islands", "St Thomas"], lat: 18.347461, long: -64.865839, ltype: 'Anchorage', cost: 'free', fuel: false, protection: 3, moorings: 0, slips: 0 },
{name: 'Hull Bay USVI', regions: ["US Virgin Islands", "St Thomas"], lat: 18.370165, long: -64.952049, ltype: 'Anchorage', cost: 'free', fuel: false, protection: 3, moorings: 0, slips: 0 },
{name: 'Nazareth Bay Anchorage', regions: ["US Virgin Islands", "St Thomas"], lat: 18.317783, long: -64.853682, ltype: 'Anchorage', cost: 'free', fuel: false, protection: 3, moorings: 0, slips: 0 },
{name: 'Vessup Bay', regions: ["US Virgin Islands", "St Thomas"], lat: 18.325628, long: -64.846527, ltype: 'Anchorage', cost: 'free', fuel: true, protection: 3, moorings: 0, slips: 0 },
{name: 'Bolongo Bay', regions: ["US Virgin Islands", "St Thomas"], lat: 18.31178, long: -64.896059, ltype: 'Anchorage', cost: 'free', fuel: false, protection: 3, moorings: 0, slips: 0 },
{name: 'Elephant Bay USVI', regions: ["US Virgin Islands", "St Thomas"], lat: 18.323961, long: -64.954364, ltype: 'Anchorage', cost: 'free', fuel: false, protection: 3, moorings: 0, slips: 0 },
{name: 'Secret Harbor USVI', regions: ["US Virgin Islands", "St Thomas"], lat: 18.317623, long: -64.853058, ltype: 'Anchorage', cost: 'free', fuel: false, protection: 3, moorings: 0, slips: 0 },
{name: 'Coral Bay Harbor USVI', regions: ["US Virgin Islands", "St John"], lat: 18.343257, long: -64.711373, ltype: 'Anchorage', cost: 'free', fuel: false, protection: 3, moorings: 0, slips: 0 },
{name: 'Great Cruz Bay', regions: ["US Virgin Islands", "St John"], lat: 18.320034, long: -64.790126, ltype: 'Anchorage', cost: 'free', fuel: false, protection: 3, moorings: 0, slips: 0 },
{name: 'Francis Bay USVI', regions: ["US Virgin Islands", "St John"], lat: 18.366871, long: -64.746508, ltype: 'Anchorage', cost: 'free', fuel: false, protection: 3, moorings: 0, slips: 0 },
{name: 'Chocolate Hole', regions: ["US Virgin Islands", "St John"], lat: 18.316499, long: -64.784843, ltype: 'Anchorage', cost: 'free', fuel: false, protection: 3, moorings: 0, slips: 0 },
{name: 'Fish Bay Gut', regions: ["US Virgin Islands", "St John"], lat: 18.32087, long: -64.764087, ltype: 'Anchorage', cost: 'free', fuel: false, protection: 3, moorings: 0, slips: 0 },
{name: 'Hansen Bay USVI', regions: ["US Virgin Islands", "St John"], lat: 18.341091, long: -64.675694, ltype: 'Anchorage', cost: 'free', fuel: false, protection: 3, moorings: 0, slips: 0 },
{name: 'Christiansted Harbor', regions: ["US Virgin Islands", "St Croix"], lat: 17.749354, long: -64.706591, ltype: 'Anchorage', cost: 'free', fuel: false, protection: 3, moorings: 0, slips: 0 },
{name: 'Teague Bay USVI', regions: ["US Virgin Islands", "St Croix"], lat: 17.756763, long: -64.604393, ltype: 'Anchorage', cost: 'free', fuel: false, protection: 3, moorings: 0, slips: 0 },
{name: 'Flamingo Bay USVI', regions: ["US Virgin Islands", "St Thomas"], lat: 18.31171, long: -64.958117, ltype: 'Anchorage', cost: 'free', fuel: false, protection: 3, moorings: 0, slips: 0 },
{name: 'Honeymoon Bay USVI', regions: ["US Virgin Islands", "St Thomas"], lat: 18.317415, long: -64.958621, ltype: 'Anchorage', cost: 'free', fuel: false, protection: 3, moorings: 0, slips: 0 },
{name: 'Chenay Bay USVI', regions: ["US Virgin Islands", "St Croix"], lat: 17.761777, long: -64.660527, ltype: 'Anchorage', cost: 'free', fuel: false, protection: 3, moorings: 0, slips: 0 },
{name: 'Nanny Cay BVI', regions: ["Caribbean", "British Virgin Islands", "Tortola" ], lat: 18.397085, long:  -64.636457, ltype: 'Marina', cost: 'marina rates', fuel: true, protection: 5, moorings: 0, slips: 180 },
{name: 'Sopers Hole Marina', regions: ["Caribbean", "British Virgin Islands", "Tortola"], lat: 18.385825, long:  -64.701404, ltype: 'Marina', cost: 'marina rates', fuel: true, protection: 5, moorings: 20, slips: 45 },
{name: 'Sopers Hole Anchorage', regions: ["Caribbean", "British Virgin Islands", "Tortola"], lat: 18.387687, long: -64.700919, ltype: 'Harbor', cost: 'free', fuel: true, protection: 5, moorings: 20, slips: 45 },
{name: 'Road Harbour BVI', regions: ["Caribbean", "British Virgin Islands", "Tortola"], lat: 18.416446, long: -64.607258, ltype: 'Harbor', cost: 'marina rates', fuel: true, protection: 5, moorings: 20, slips: 200 },
{name: 'Great Harbour BVI', regions: ["Caribbean", "British Virgin Islands", "Jost Van Dyke"], lat: 18.442989, long:  -64.750595, ltype: 'Mooring Field', cost: 'marina rates', fuel: true, protection: 4, moorings: 0, slips: 20 },
{name: 'White Bay BVI', regions: ["Caribbean", "British Virgin Islands", "Jost Van Dyke"], lat: 18.441218, long:  -64.760007, ltype: 'Anchorage', cost: 'free', fuel: false, protection: 2, moorings: 0, slips: 0 },
{name: 'Daimond Cay BVI', regions: ["Caribbean", "British Virgin Islands", "Jost Van Dyke"], lat: 18.450208, long: -64.724511, ltype: 'Anchorage', cost: 'free', fuel: false, protection: 4, moorings: 10, slips: 0 },
{name: 'Spanish Town Virgin Gorda Yacht Harbour', regions: ["Caribbean", "British Virgin Islands", "Virgin Gorda"], lat: 18.449349, long:  -64.437647, ltype: 'Marina', cost: 'marina rates', fuel: true, protection: 5, moorings: 0, slips: 30 },
{name: 'Spanish Town Harbour Anchorage', regions: ["Caribbean", "British Virgin Islands", "Virgin Gorda"], lat: 18.454494, long:  -64.440085, ltype: 'Anchorage', cost: 'free', fuel: false, protection: 4, moorings: 0, slips: 0 },
{name: 'Bitter End Yacht Club', regions: ["Caribbean", "British Virgin Islands", "Virgin Gorda"], lat: 18.500538, long: -64.358803, ltype: 'Marina', cost: 'marina rates', fuel: true, protection: 5, moorings: 70, slips: 20 },
{name: 'Chub Cay Marina', regions: ["Caribbean", "Bahamas", "Berry Islands"], lat: 25.412294, long: -77.906353, ltype: 'Marina', cost: '$2.75 (low season) $4.35 (reg season)', fuel: true, protection: 5, moorings: 0, slips: 110 },
{name: 'Great Harbour Cay Marina', regions: ["Caribbean", "Bahamas", "Berry Islands"], lat: 25.747922, long:  -77.859598, ltype: 'Marina', cost: 'marina rates', fuel: true, protection: 5, moorings: 0, slips: 80 },
{name: 'Marsh Harbour Bahamas', regions: ["Caribbean", "Bahamas", "Abaco Islands"], lat: 26.543718, long: -77.046396, ltype: 'Harbor', cost: 'marina rates', fuel: true, protection: 5, moorings: 0, slips: 70 },
{name: 'Nassau Harbour', regions: ["Caribbean", "Bahamas", "New Providence"], lat: 25.076485, long: -77.311489, ltype: 'Harbor', cost: 'marina rates', fuel: true, protection: 5, moorings: 200, slips: 1500 },
{name: 'Browns Marina Bahamas', regions: ["Caribbean", "Bahamas", "Bimini Islands"], lat: 25.722178, long:  -79.299282, ltype: 'Marina', cost: 'marina rates', fuel: true, protection: 5, moorings: 0, slips: 30 },
{name: 'Compass Cay Marina', regions: ["Caribbean", "Bahamas", "Exuma"], lat: 24.26075, long: -76.513154, ltype: 'Marina', cost: 'marina rates', fuel: false, protection: 5, moorings: 0, slips: 20 },
{name: 'Cayman Islands Yacht Club Marina', regions: ["Caribbean", "Cayman Islands"], lat: 19.356011, long:  -81.377286, ltype: 'Marina', cost: 'marina rates', fuel: true, protection: 5, moorings: 0, slips: 158 },
{name: 'Tobago Cays Marine Park', regions: ["Caribbean", "St Vincent and the Grenadines"], lat: 12.630456, long: -61.355395, ltype: 'Mooring Field', cost: '$45 daily fee', fuel: false, protection: 4, moorings: 30, slips: 0 },
{name: 'Boqueron Bay Anchorage', regions: ["Caribbean", "Puerto Rico"], lat: 18.023597, long:  -67.175849, ltype: 'Anchorage', cost: 'free', fuel: true, protection: 4, moorings: 0, slips: 0 },
{name: 'Ensenada Honda', regions: ["Caribbean", "Puerto Rico"], lat: 18.307116, long:  -65.298995, ltype: 'Anchorage', cost: 'free', fuel: true, protection: 4, moorings: 0, slips: 0 },
{name: 'Freemans Bay Anchorage', regions: ["Caribbean" , "Antigua and Barbuda"], lat: 17.00302, long: -61.760165, ltype: 'Anchorage', cost: 'free', fuel: true, protection: 3, moorings: 0, slips: 0 },
{name: 'Cul-de-Sac du Marin Anchorage', regions: ["Caribbean", "Martinique"], lat: 14.459969, long: -60.874882, ltype: 'Anchorage', cost: 'free', fuel: true, protection: 5, moorings: 0, slips: 0 },
{name: 'Deshaies Anchorage', regions: ["Caribbean", "Guadeloupe"], lat: 16.306847, long: -61.796471, ltype: 'Anchorage', cost: 'free', fuel: false, protection: 4, moorings: 0, slips: 0 },
{name: 'Harbour Village Marina', regions: ["Caribbean", "Bonaire"], lat: 12.163664, long:  -68.284870, ltype: 'Marina', cost: 'marina rates', fuel: true, protection: 5, moorings: 0, slips: 60 },
{name: 'Kralendijk', regions: ["Caribbean", "Bonaire"], lat: 12.160806, long:  -68.283268, ltype: 'Mooring Field', cost: '$10 daily fee', fuel: true, protection: 4, moorings: 30, slips: 0 },
{name: 'St. Georges Outside Lagoon', regions: ["Caribbean", "Grenada"], lat: 12.041418, long: -61.757048, ltype: 'Anchorage', cost: 'free', fuel: true, protection: 4, moorings: 0, slips: 0 },
{name: 'Veradero Marina', regions: ["Caribbean", "Aruba"], lat: 12.498812, long: -70.018248, ltype: 'Marina', cost: 'marina rates', fuel: true, protection: 5, moorings: 0, slips: 70 },
{name: 'Carlisle Bay', regions: ["Caribbean", "Barbados"], lat: 13.087842, long:  -59.611353, ltype: 'Anchorage', cost: 'free', fuel: true, protection: 3, moorings: 0, slips: 0 },
{name: 'Port St. Charles Marina', regions: ["Caribbean", "Barbados"], lat: 13.262017, long:  -59.642263, ltype: 'Marina', cost: 'marina rates', fuel: true, protection: 5, moorings: 0, slips: 110 },
{name: 'Rodney Bay St Lucia', regions: ["Caribbean", "St Lucia" ], lat: 14.076497, long:  -60.957348, ltype: 'Harbor', cost: 'marina rates', fuel: true, protection: 4, moorings: 400, slips: 250 },
{name: 'Simpson Bay Lagoon', regions: ["Caribbean", "Sint Maarten"], lat: 18.047713, long:  -63.094734, ltype: 'Anchorage', cost: 'free', fuel: true, protection: 5, moorings: 0, slips: 0 },
{name: 'Blue Haven Marina', regions: ["Caribbean", "Turks and Caicos"], lat: 21.81886, long:  -72.146723, ltype: 'Marina', cost: 'marina rates', fuel: true, protection: 5, moorings: 0, slips: 0 },
{name: 'Spaanse Water', regions: ["Caribbean", "Curacao"], lat: 12.081601, long: -68.862105, ltype: 'Anchorage', cost: 'free', fuel: true, protection: 4, moorings: 0, slips: 0 },
{name: 'Santa Cruz Beach', regions: ["Caribbean", "Curacao"], lat: 12.305965, long:  -69.147839, ltype: 'Anchorage', cost: 'free', fuel: false, protection: 3, moorings: 0, slips: 0 },
{name: 'Little Bay', regions: ["Caribbean", "Montserrat"], lat: 16.801825, long:  -62.206949, ltype: 'Anchorage', cost: 'free', fuel: false, protection: 3, moorings: 0, slips: 0 },
{name: 'Store Bay', regions: ["Caribbean", "Trinidad and Tobago"], lat: 11.15668, long:  -60.841118, ltype: 'Anchorage', cost: 'free', fuel: false, protection: 4, moorings: 0, slips: 0 },
{name: 'Oranjestad Bay', regions: ["Caribbean", "Statia"], lat: 17.479881, long: -62.9883, ltype: 'Mooring Field', cost: '$10/day', fuel: false, protection: 4, moorings: 50, slips: 0 },
{name: 'Anse de Colombier', regions: ["Caribbean", "St Barts"], lat: 17.923855, long:  -62.870137, ltype: 'Anchorage', cost: 'free', fuel: false, protection: 3, moorings: 0, slips: 0 },
{name: 'Ballast Bay St Kitts', regions: ["St Kitts and Nevis"], lat: 17.240148, long: -62.658949, ltype: 'Anchorage', cost: 'free', fuel: false, protection: 3, moorings: 0, slips: 0 },
{name: 'Cockleshell Bay St Kitts', regions: ["St Kitts and Nevis"], lat: 17.228834, long: -62.633117, ltype: 'Anchorage', cost: 'free', fuel: false, protection: 3, moorings: 0, slips: 0 }
 ##### ADD COMMA HERE #######
]

user = User.find(1)
locations.map do |l|
  loc = Location.find_or_create_by(name: l[:name])
  loc.user = user
  loc.save
  if loc.stat.nil?
    loc.create_stat(lat: l[:lat], long: l[:long], ltype: l[:ltype], cost: l[:cost], fuel: l[:fuel], protection: l[:protection], slips: l[:slips], moorings: l[:moorings])

    l[:regions].each do |r|
      reg = Region.find_by_name(r)
      loc.regions << reg
      loc.set_root_regions
    end
  end
end
