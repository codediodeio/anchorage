class Anchor < ActiveRecord::Base
  belongs_to :user
  belongs_to :anchorable, counter_cache: true, polymorphic: true

  after_create :anchor_milestones
  after_commit :update_location_counts

  scope :experiences, -> { where(anchorable_type: 'Experience') }
  scope :images, -> { where(anchorable_type: 'Image') }

  validate :users_cant_anchor_their_own

  def users_cant_anchor_their_own
    return if user.nil? || anchorable.nil?
    if user_id == anchorable.user_id
      errors[:base] = "Can't anchor your own posts"
    end
  end

  def anchorable_user
    # the user that received the anchor
    anchorable.user
  end

  private

  def update_location_counts
    CountWorker.perform_async(anchorable.location_id)
  end

  def anchor_milestones
    ActivityMailer.delay_for(5.seconds, retry: false).five_anchors(anchorable.user.id)
  end
end
