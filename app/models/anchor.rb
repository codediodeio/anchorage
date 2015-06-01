class Anchor < ActiveRecord::Base
  belongs_to :user
  belongs_to :anchorable, counter_cache: true, polymorphic: true

  after_create :anchor_milestones

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
    # the user that received the anchor
    self.anchorable.user
  end

  def anchor_milestones
    ActivityMailer.delay_for(5.seconds, retry: false).five_anchors(self.anchorable.user.id)
  end

end
