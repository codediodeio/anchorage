class User < ActiveRecord::Base
  has_merit
  mount_uploader :image, AvatarUploader

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable,    :omniauth_providers => [:google_oauth2, :facebook]

         after_create :generate_guide
         after_create :send_welcome_email
         after_save :analytics_identify
         before_validation :generate_username, on: :create

         validates :username, presence: true, uniqueness: true, length: { minimum: 3, maximum: 20 }, format: { with: /\A[a-zA-Z0-9]+\Z/ }
         validate :file_size
         validates :fname, :lname, length: { maximum: 20 }
         validates :boatname, :boatmodel, :location, length: { maximum: 30 }
         validates :bio, length: { maximum: 2000 }
         validates :blog, :donation, length: { maximum: 100 }

  has_many :experiences
  has_many :images
  has_many :locations
  has_many :anchors
  has_many :guides, dependent: :destroy
  has_many :pages, -> { distinct }, through: :guides
  has_many :anchored_experiences, -> { distinct }, through: :anchors, source: :anchorable, source_type: "Experience" # Experiences anchored by this user
  has_many :anchored_images, -> { distinct }, through: :anchors, source: :anchorable, source_type: "Image"

  # Received Anchors
  has_many :experience_anchors, through: :experiences, source: :anchors # via other users
  has_many :image_anchors, through: :images, source: :anchors # via other users


  def to_param
    "#{id}-#{username.parameterize}"
  end

  def generate_username

   names = ["oldsalt", "swashbuckler", "pirate", "deckscrubber", "railmeat", "bilgecleaner", "anchordragger", "marooned", "scallywag", "headclogger", "captainahab", "deadwood", "accidentaljiber", "scuttlebutt", "dismaster"]

    random_name = names.sample
    number = User.count+230
    username = "#{random_name}#{number}"

    if self.uid.present?
      self.username = "#{random_name}#{uid.to_s[0..3]}"
    else

      if User.exists?(username: username)
        self.username = "tridentghost#{number}"
      else
        self.username = username
      end
    end

  end

  def generate_guide
    self.guides.create!(name: "My Cruising Guide")
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.remote_image_url = auth.info.image.gsub('http://','https://')
    end
  end

  def analytics_identify
    Analytics.identify(
      user_id: self.id,
      traits: {
        email: self.email,
        username: self.username,
        blog: self.blog,
        created_at: self.created_at
      })
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
    anchor = self.anchors.where(anchorable_id: anchorable.id, anchorable_type: anchorable.class.name)
    anchor.destroy_all
  end

  def anchor?(anchorable)
  anchor = self.anchors.where(anchorable_id: anchorable.id, anchorable_type: anchorable.class.name)
    if anchor.empty?
      false
    else
      true
    end
  end

  def has_page?(location)
    self.pages.find_by_location_id(location.id)
  end

  def total_anchors
    #total anchors received from other users
    self.image_anchors.count + self.experience_anchors.count
  end

  def send_welcome_email
    ActivityMailer.delay_for(5.seconds).welcome(self)
    ActivityMailer.delay_for(5.seconds).new_user_alert(self)
  end

end
