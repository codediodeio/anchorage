class Location < ActiveRecord::Base

has_many :experiences
has_many :images
has_and_belongs_to_many :regions
has_many :pages
has_one :stat, dependent: :destroy
accepts_nested_attributes_for :stat
belongs_to :user

scope :featured, -> { where(featured: true) }
scope :popular, -> { order('anchor_count DESC') }
scope :most_photos, -> { order('image_count DESC') }
scope :most_experiences, -> { order('experience_count DESC') }

validates :name, presence: true
validates :permalink, uniqueness: true

before_validation :generate_permalink, on: :create
# after_create :generate_stat

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

  def update_counts
    # TODO counts for anchors, images, and locations
    # Background after commit - > image, experience, anchor
    e_anchors = self.experiences.pluck(:anchors_count).sum
    i_anchors = self.images.pluck(:anchors_count).sum

    a_count = i_anchors + e_anchors
    e_count = self.experiences.count
    i_count = self.images.count
    self.update_columns(anchor_count: a_count, experience_count: e_count, image_count: i_count)
  end

  include PgSearch
  pg_search_scope :location_search,
                        against: [:name, :permalink],
                        associated_against: {regions: :name },
                        using: [:trigram]

  def self.search(query)
    if query.length <= 4
    where("name ILIKE ? OR permalink ILIKE ?", "%#{query}%", "%#{query}%") #basic
    else
    location_search(query) #pg_search
    end
  end

  private

  def generate_stat
    if self.stat.nil? then self.create_stat end
  end

  def generate_permalink
    pattern = self.name.parameterize
    duplicates = Location.where("permalink LIKE ?", "#{pattern}%")

    if duplicates.empty?
      self.permalink = pattern
    else
      self.permalink = "#{pattern}-#{duplicates.count+1}"
    end
  end

end
