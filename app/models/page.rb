class Page < ActiveRecord::Base
  belongs_to :guide
  belongs_to :location


  def experiences
    self.guide.user.anchored_experiences.where(location_id: self.location_id)
  end

  def images
    self.guide.user.anchored_images.where(location_id: self.location_id)
  end

  def regions
    self.location.regions
  end

end
