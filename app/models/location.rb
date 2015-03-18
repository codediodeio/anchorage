class Location < ActiveRecord::Base

has_many :experiences
has_many :users
has_many :images
has_and_belongs_to_many :regions


  def to_param
    "#{id}-#{name.parameterize}"
  end

  def add_region(region)
    self.regions << region
  end

  def delete_region(region)
    self.regions.delete(region)
  end

end
