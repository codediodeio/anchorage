class Post < ActiveRecord::Base

  before_create :generate_permalink

  validates :title, uniqueness: true

  def to_param
    permalink
  end

  def preview_text
    self.body[0, 300]
  end

  protected

  def generate_permalink
    self.permalink = self.title.parameterize
  end

end
