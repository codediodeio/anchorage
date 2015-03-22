class Image < ActiveRecord::Base
  mount_uploader :file, ImageUploader

  #validates_presence_of :file, message: "not valid. Accepted formats are jpg, jpeg, gif, and png. 5MB max size."
  #validates :description, presence: true
  #validate :file_size

  belongs_to :user
  belongs_to :location

  has_many :anchors, as: :anchorable, dependent: :destroy
  has_many :anchored_users, through: :anchors, source: :user




  def file_size
    unless file.file.nil?
      if file.file.size.to_f > 5000000 #5 MB
        errors.add(:file, "cannot be larger than 5 MB")
      end
    end
  end

end
