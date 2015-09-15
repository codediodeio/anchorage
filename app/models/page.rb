class Page < ActiveRecord::Base
  belongs_to :guide
  belongs_to :location

  validates_uniqueness_of :location_id, scope: :guide_id

  def experiences
    guide.user.anchored_experiences.where(location_id: location_id)
  end

  def images
    guide.user.anchored_images.where(location_id: location_id)
  end

  def regions
    location.regions
  end
end
