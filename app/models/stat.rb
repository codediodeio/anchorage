class Stat < ActiveRecord::Base
  belongs_to :location

  def default_description

    "#{self.location.name} is #{a_an(self.ltype.downcase)} located at #{self.lat} #{self.latd}, #{self.long} #{self.longd}. #{self.protection_analysis}. There are #{self.slips} slips and #{self.moorings} mooring bouys available. Berthing costs are estimated to be #{self.cost}. #{self.fuel_avail?}."

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

end
