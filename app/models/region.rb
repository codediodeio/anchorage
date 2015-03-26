class Region < ActiveRecord::Base
  has_and_belongs_to_many :locations


  before_validation :generate_permalink, on: :create

  def generate_permalink
    self.permalink = self.name.parameterize
  end

  def to_param
    permalink
  end

  def check_it(location)
    if self.locations.include?(location)
      "checked"
    end
  end

end
