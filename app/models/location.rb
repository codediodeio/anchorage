class Location < ActiveRecord::Base

has_many :experiences
has_many :images
has_and_belongs_to_many :regions
has_many :pages
has_one :stat


  def to_param
    "#{id}-#{name.parameterize}"
  end

  def add_region(region)
    self.regions << region
  end

  def delete_region(region)
    self.regions.delete(region)
  end

  searchable do
    text :name, boost: 3
    text :experiences do
      experiences.map { |exp| exp.body }
    end
    text :images do
      images.map { |img| img.description }
    end
    text :regions do
      regions.map { |reg| reg.name }
    end
  end

end
