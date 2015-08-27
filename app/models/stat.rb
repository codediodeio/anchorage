class Stat < ActiveRecord::Base
  belongs_to :location

  def default_description

    "#{self.location.name} is #{a_an(self.ltype.downcase)} located at #{self.lat} #{self.latd}, #{self.long} #{self.longd}. #{self.protection_analysis}. There are #{self.slips} slips and #{self.moorings} mooring buoys available. Berthing costs are estimated to be #{self.cost}. #{self.fuel_avail?}."

    #"The expected weather protection radius, moving clockwise, starts at #{self.pstart}&deg; and ends at #{self.pend}&deg; true."
  end

  def a_an(word)
    %w(a e i o u).include?(word[0].downcase) ? "an #{word}" : "a #{word}"
  end

  def fuel_avail?
    if self.fuel?
      "Diesel fuel and gasoline are available, unless otherwise noted"
    else
      "Fuel is not available near this location"
    end
  end

  def protection_analysis
    if self.protection == 5
      "Vessels can find protection during all weather conditions, including storms"
    elsif self.protection == 4
      "Vessels can find protection during most prevailing conditions, but not storms"
    elsif self.protection == 3
      "Vessels can find protection during moderate weather conditions, with some exposure"
    elsif self.protection == 2
      "Vessels can find protection during calm weather, with exposure from multiple directions"
    elsif self.protection == 1
      "Vessels will not have protection in this location, it is completely exposed to weather"
    else
      "The weather protection quality is unknown in this location"
    end
  end

  def radians(degrees)
    degrees * Math::PI / 180
  end

  def near
    lat = self.lat
    long = self.long

    lat_range = (lat-0.1)..(lat+0.1)
    long_range = (long-0.1)..(long+0.1)
    close_spots = Stat.includes(:location).where(lat: lat_range).where(long: long_range).where.not(id: self.id).limit(10)
    initial_count = close_spots.count

    if initial_count < 10
      max_count = 10-initial_count
      lat_range_2 = (lat-0.5)..(lat+0.5)
      long_range_2 = (long-0.5)..(long+0.5)
      close_spots_2 = Stat.includes(:location).where(lat: lat_range_2).where(long: long_range_2).where.not(id: self.id).reverse_order.limit(max_count)
      close_spots = close_spots + close_spots_2
    end

    close_spots

  end

  def calc_distance(lat, long)

    lat1 = self.lat
    lat2 = lat
    long1 = self.long
    long2 = long

    rad = 6371000 # metres

    one = radians(lat1)
    two = radians(lat2)
    cir = radians((lat2-lat1))
    tri = radians((long2-long1))

    a = Math.sin(cir/2) * Math.sin(cir/2) + Math.cos(one) * Math.cos(two) * Math.sin(tri/2) * Math.sin(tri/2)
    c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a))
    d = rad * c
    miles = d * 0.00062137

    miles.round(2)

  end


end
