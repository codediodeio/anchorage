class Guide < ActiveRecord::Base
  belongs_to :user
  has_many :pages
  has_many :locations, through: :pages

  before_validation :generate_permalink

  validate :max_guides

  def generate_permalink
    self.permalink = self.name.parameterize
  end

  def to_param
    permalink
  end

  def max_guides
    if self.user.guides.count >= 5
      errors.add(:user, "cannot create more than 5 custom cruising guides")
    end
  end

  def has_page?(location)
    self.pages.find_by_location_id(location.id)
  end

  def regions
    ids = self.locations.map {|l| l.region_ids.uniq }
    Region.find(ids)
  end



end
