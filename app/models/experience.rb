class Experience < ActiveRecord::Base
  belongs_to :user
  belongs_to :location

  after_create :analytics_experience
  after_create :first_experience_email
  after_commit :update_location_counts

  validates :body, length: { minimum: 5, maximum: 8000 }
  validates :user_id, uniqueness: { scope: :location_id, message: 'already posted an experience for this location. You can always edit or append your other experience' }
  validates :lat, numericality: { less_than_or_equal_to: 90.0, greater_than_or_equal_to: -90.0 }
  validates :long, numericality: { less_than_or_equal_to: 180.0, greater_than_or_equal_to: -180.0 }

  has_many :anchors, as: :anchorable, dependent: :destroy
  has_many :anchored_users, through: :anchors, source: :user

  def analytics_experience
    Analytics.track(
      user_id: user_id,
      event: 'Shared Experience',
      properties: {
        username: user.username,
        length: body.length })
  end

  def map_data
    [lat, long, user.username] if lat && long
  end

  def latd
    if lat.nil? || lat == 0 then latd = ''
    elsif lat > 0 then latd = 'N'
    else latd = 'S'
    end
    latd
  end

  def longd
    if long.nil? || long == 0 then longd = ''
    elsif long > 0 then longd = 'E'
    else longd = 'W'
    end
    longd
  end

  private

  def update_location_counts
    CountWorker.perform_async(location_id)
  end

  def first_experience_email
    ActivityMailer.delay_for(5.seconds, retry: false).first_experience(id)
  end
end
