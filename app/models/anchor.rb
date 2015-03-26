class Anchor < ActiveRecord::Base
  belongs_to :user
  belongs_to :anchorable, counter_cache: true, polymorphic: true

  scope :experiences, -> { where(anchorable_type: "Experience") }
  scope :images, -> { where(anchorable_type: "Image") }

  validate :users_cant_anchor_their_own

  def users_cant_anchor_their_own
    return if user.nil? or anchorable.nil?
    if user_id == anchorable.user_id
      errors[:base] = "Can't anchor your own posts"
    end
  end

  def anchorable_user
    self.anchorable.user
  end

end
