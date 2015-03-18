class Image < ActiveRecord::Base
  belongs_to :user
  belongs_to :location

  has_many :anchors, as: :anchorable, dependent: :destroy
  has_many :anchored_users, through: :anchors, source: :user

  #validates :file, presence: true
  validates :description, presence: true

  mount_uploader :file, ImageUploader

  def file_size
    unless file.file.nil?
      if file.file.size.to_f > 5000000 #5 MB
        errors.add(:file, "You cannot upload a file greater than 5 MB")
      end
    end
  end

end
