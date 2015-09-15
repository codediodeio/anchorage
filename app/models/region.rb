class Region < ActiveRecord::Base
  has_and_belongs_to_many :locations, -> { uniq }

  has_many :sub_regions, class_name: 'Region', foreign_key: 'parent_id'
  belongs_to :parent_region, class_name: 'Region', foreign_key: 'parent_id'

  validates :name, presence: true, uniqueness: true

  after_validation :generate_permalink, on: :create

  def generate_permalink
    self.permalink = name.parameterize
  end

  def sub_regions_deep
    regions = []
    sub_regions.each do |reg|
      subs = reg.sub_regions.includes(:sub_regions)
      sub_ids = subs.pluck(:id)
      subs.each do |s|
        ids = s.sub_regions.pluck(:id)
        regions.push(ids)
      end
      regions.push(reg.id, sub_ids)
    end
    Region.find(regions)
  end

  def root_parent
    region = parent_region
    until region.nil?
      root = region
      region = region.parent_region
    end
    root
  end

  def to_param
    permalink
  end
end
