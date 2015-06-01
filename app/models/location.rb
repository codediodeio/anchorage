class Location < ActiveRecord::Base

has_many :experiences
has_many :images
has_and_belongs_to_many :regions
has_many :pages
has_one :stat

scope :featured, -> { where(featured: true) }

validates :permalink, uniqueness: true

before_validation :generate_permalink, on: :create

  def generate_permalink
    pattern = self.name.parameterize
    duplicates = Location.where("permalink LIKE ?", "#{pattern}%")

    if duplicates.empty?
      self.permalink = pattern
    else
      self.permalink = "#{pattern}-#{duplicates.count+1}"
    end
  end

  def map_data
    url = "/locations/#{self.permalink}"
    [self.name, self.stat.lat, self.stat.long, url]
  end

  def to_param
    permalink
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
