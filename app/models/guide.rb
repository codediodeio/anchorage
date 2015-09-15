class Guide < ActiveRecord::Base
  belongs_to :user
  has_many :pages, -> { distinct }, dependent: :destroy
  has_many :locations, -> { distinct }, through: :pages

  before_validation :generate_permalink

  validates :name, presence: true, length: { maximum: 80 }
  validate :max_guides

  def generate_permalink
    self.permalink = name.parameterize
  end

  def to_param
    permalink
  end

  def max_guides
    if user.guides.count >= 5
      errors.add(:user, 'cannot create more than 5 custom cruising guides')
    end
  end

  def has_page?(location)
    pages.find_by_location_id(location.id)
  end

  def regions
    ids = locations.map { |l| l.region_ids.uniq }
    Region.find(ids)
  end
end
