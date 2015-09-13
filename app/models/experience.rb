class Experience < ActiveRecord::Base
  belongs_to :user
  belongs_to :location

  after_create :analytics_experience
  after_create :first_experience_email
  after_commit :update_location_counts

  validates :body, length: { minimum: 5, maximum: 8000 }
  validates :user_id, uniqueness: { scope: :location_id, message: "already posted an experience for this location. You can always edit or append your other experience" }
  validates :lat, numericality: { less_than_or_equal_to: 90.0, greater_than_or_equal_to: -90.0 }
  validates :long, numericality: { less_than_or_equal_to: 180.0, greater_than_or_equal_to: -180.0 }

  has_many :anchors, as: :anchorable, dependent: :destroy
  has_many :anchored_users, through: :anchors, source: :user


  def analytics_experience
    Analytics.track(
      user_id: self.user_id,
      event: 'Shared Experience',
      properties: {
        username: self.user.username,
        length: self.body.length })
  end

  def map_data
    if self.lat && self.long
      [self.lat, self.long, self.user.username]
    end
  end

  def latd
    if self.lat.nil? || self.lat==0 then latd=""
    elsif self.lat > 0 then latd="N"
    else latd="S"
    end
    latd
  end

  def longd
    if self.long.nil? || self.long==0 then longd=""
    elsif self.long > 0 then longd="E"
    else longd="W"
    end
    longd
  end

  private

  def update_location_counts
    CountWorker.perform_async(self.location_id)
  end

  def first_experience_email
    ActivityMailer.delay_for(5.seconds, retry: false).first_experience(self.id)
  end


end
