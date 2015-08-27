class Experience < ActiveRecord::Base
  belongs_to :user
  belongs_to :location

  after_create :analytics_experience
  after_create :first_experience_email
  after_commit :update_location_counts

  validates :body, presence: true, length: { minimum: 30, maximum: 8000 }
  validates :user_id, uniqueness: { scope: :location_id, message: "already posted an experience for this location. You can always edit or append your other experience" }

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

  private

  def update_location_counts
    CountWorker.perform_async(self.location_id)
  end

  def first_experience_email
    ActivityMailer.delay_for(5.seconds, retry: false).first_experience(self.id)
  end


end
