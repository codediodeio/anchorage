class Guide < ActiveRecord::Base
  belongs_to :user

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


end
