class Experience < ActiveRecord::Base
  belongs_to :user
  belongs_to :location

  validates :body, presence: true
  validates :user_id, uniqueness: { scope: :location_id, message: "already posted an experience for this location. You can always edit or append your other experience" }

  has_many :anchors, as: :anchorable, dependent: :destroy
  has_many :anchored_users, through: :anchors, source: :user

end
