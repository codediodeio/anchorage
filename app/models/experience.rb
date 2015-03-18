class Experience < ActiveRecord::Base
  belongs_to :user
  belongs_to :location

  validates :body, presence: true

  has_many :anchors, as: :anchorable, dependent: :destroy
  has_many :anchored_users, through: :anchors, source: :user

end
