class Image < ActiveRecord::Base
  mount_uploader :file, ImageUploader
  process_in_background :file

  validates_presence_of :file, message: 'not valid. Accepted formats are jpg, jpeg, gif, and png. 5MB max size.'
  validates :description, length: { maximum: 250 }
  validate :file_size
  validates :user_id, presence: true
  validates :location_id, presence: true

  belongs_to :user
  belongs_to :location
  after_create :analytics_image
  after_commit :update_location_counts

  has_many :anchors, as: :anchorable, dependent: :destroy
  has_many :anchored_users, through: :anchors, source: :user

  def file_size
    unless file.file.nil?
      if file.file.size.to_f > 5_000_000 # 5 MB
        errors.add(:file, 'cannot be larger than 5 MB')
      end
    end
  end

  def analytics_image
    Analytics.track(
      user_id: user_id,
      event: 'Shared Image',
      properties: {
        username: user.username,
        size: file.file.size,
        description: description.length
      })
  end

  private

  def update_location_counts
    CountWorker.perform_async(location_id)
  end
end
