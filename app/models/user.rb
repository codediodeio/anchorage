class User < ActiveRecord::Base
  has_merit
  mount_uploader :image, AvatarUploader

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable,    :omniauth_providers => [:google_oauth2, :facebook]

         before_validation :generate_username, on: :create

         validates :username, uniqueness: true
         validate :file_size

  has_many :experiences
  has_many :images
  has_many :locations
  has_many :anchors
  has_many :guides
  has_many :pages, through: :guides
  has_many :anchored_experiences, through: :anchors, source: :anchorable, source_type: "Experience" # Experiences anchored by this user
  has_many :anchored_images, through: :anchors, source: :anchorable, source_type: "Image"

  # Received Anchors
  has_many :experience_anchors, through: :experiences, source: :anchors # via other users
  has_many :image_anchors, through: :images, source: :anchors # via other users

  after_validation :log_errors, :if => Proc.new {|m| m.errors}

  def log_errors
    Rails.logger.debug self.errors.full_messages.join("\n")
  end

  def to_param
    "#{id}-#{username.parameterize}"
  end

  def generate_username
    names = ["oldsalt", "swashbuckler", "pirate", "deckscrubber", "railmeat", "bilgecleaner", "anchordragger", "marooned", "scallywag", "headclogger", "captainahab", "deadwood", "accidentaljiber", "scuttlebutt", "dismaster"]

    random_name = names.sample
    number = User.count+230
    username = "#{random_name}#{number}"

    if User.exists?(username: username)
      self.username = "tridentghost#{number}"
    else
      self.username = username
    end
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]  # assuming the user model has a name
      user.remote_image_url = auth.info.image.gsub('http://','https://') # assuming the user model has an image
    end
  end


  def file_size
    unless image.file.nil?
      if image.file.size.to_f > 5000000 #5 MB
        errors.add(:image, "cannot be larger than 5 MB")
      end
    end
  end

  def user_time
    time = Time.now
    value = time - self.created_at
  end

  def full_name
    "#{self.fname} #{self.lname}"
  end

  def anchor!(anchorable)
    self.anchors.create!(anchorable_id: anchorable.id, anchorable_type: anchorable.class.name)
  end

  def unanchor!(anchorable)
    anchor = self.anchors.find_by_anchorable_id(anchorable.id)
    anchor.destroy!
  end

  def anchor?(anchorable)
    self.anchors.find_by_anchorable_id(anchorable.id)
  end

  def has_page?(location)
    self.pages.find_by_location_id(location.id)
  end

  def total_anchors
    #total anchors received from other users
    self.image_anchors.count + self.experience_anchors.count
  end

end
