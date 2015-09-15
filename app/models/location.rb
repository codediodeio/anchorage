class Location < ActiveRecord::Base
  has_many :experiences
  has_many :images
  has_and_belongs_to_many :regions, -> { uniq }
  has_many :pages
  has_one :stat, dependent: :destroy
  accepts_nested_attributes_for :stat
  belongs_to :user

  scope :featured, -> { where(featured: true) }
  scope :popular, -> { order('anchor_count DESC') }
  scope :most_photos, -> { order('image_count DESC') }
  scope :most_experiences, -> { order('experience_count DESC') }

  validates :name, presence: true, length: { minimum: 2, maximum: 125 }
  validates :permalink, uniqueness: true
  after_save :set_root_regions

  before_validation :generate_permalink

  def map_data
    url = "/locations/#{permalink}"
    [name, stat.lat, stat.long, url]
  end

  def to_param
    permalink
  end

  def add_region(region)
    regions << region
  end

  def delete_region(region)
    regions.delete(region)
  end

  def update_counts
    e_anchors = experiences.pluck(:anchors_count).sum
    i_anchors = images.pluck(:anchors_count).sum

    a_count = i_anchors + e_anchors
    e_count = experiences.count
    i_count = images.count
    update_columns(anchor_count: a_count, experience_count: e_count, image_count: i_count)
  end

  include PgSearch
  pg_search_scope :location_search,
                  against: [:name, :permalink],
                  associated_against: { regions: :name },
                  using: [:tsearch, :trigram]

  def self.search(query)
    if query.length <= 4
      where('name ILIKE ? OR permalink ILIKE ?', "%#{query}%", "%#{query}%") # basic
    else
      location_search(query) # pg_search
    end
  end

  def set_root_regions
    regions = []
    self.regions.each do |region|
      first = region.parent_region
      if first
        regions.push(first)
        second = first.parent_region
      end
      if second
        regions.push(second)
        third = second.parent_region
      end
      regions.push(third) if third
    end
    self.regions << regions.uniq
  end

  # private

  def generate_permalink
    pattern = name.parameterize
    duplicates = Location.where('permalink LIKE ?', "#{pattern}%").where.not(id: id)

    if duplicates.empty?
      self.permalink = pattern
    else
      self.permalink = "#{pattern}-#{duplicates.count + 1}"
    end
  end
end
