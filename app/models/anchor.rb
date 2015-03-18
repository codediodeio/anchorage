class Anchor < ActiveRecord::Base
  belongs_to :user
  belongs_to :anchorable, polymorphic: true

  scope :experiences, -> { where(anchorable_type: "Experience") }
  scope :images, -> { where(anchorable_type: "Image") }

end
