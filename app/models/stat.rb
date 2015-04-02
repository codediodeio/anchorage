class Stat < ActiveRecord::Base
  belongs_to :location

  def default_description
    "#{self.location.name} is #{a_an(self.ltype.downcase)} located at #{self.lat} #{self.latd}, #{self.long} #{self.longd}. Vessels can find protection #{self.protection}. The expected weather protection radius, moving clockwise, starts at #{self.pstart}&deg; and ends at #{self.pend}&deg; true. There are #{self.slips} slips and #{self.moorings} mooring bouys available. Berthing costs are estimated to be #{self.cost}. #{self.fuel_avail?}."
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
end
