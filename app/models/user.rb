class User < ActiveRecord::Base
  has_merit
  mount_uploader :image, AvatarUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2, :facebook]

  before_validation :generate_username, on: :create
  after_validation :downcase_username
  after_create :generate_guide
  after_create :send_welcome_email
  after_save :analytics_identify

  validates :username, presence: true, uniqueness: true, length: { minimum: 3, maximum: 20 }, format: { with: /\A[a-zA-Z0-9]+\Z/ }
  validates_exclusion_of :username, in: %w( dashboard superuser photos experiences locations about privacy contact terms regions location region fuck shit cock piss pages page policy guide guidebook user admin member anchor anchors received feed cunt anchored anchorageio anchorage home news blog account profile detail details boat yacht edit update destroy default save new photo image photos images feed posts post blogs )
  validate :file_size
  validates :fname, :lname, length: { maximum: 20 }
  validates :boatname, :boatmodel, :location, length: { maximum: 30 }
  validates :bio, length: { maximum: 2000 }
  validates :blog, :donation, length: { maximum: 100 }

  has_many :experiences
  has_many :images
  has_many :locations
  has_many :anchors
  has_many :identities
  has_many :guides, dependent: :destroy
  has_many :pages, -> { distinct }, through: :guides
  has_many :anchored_experiences, -> { distinct }, through: :anchors, source: :anchorable, source_type: 'Experience' # Experiences anchored by this user
  has_many :anchored_images, -> { distinct }, through: :anchors, source: :anchorable, source_type: 'Image'

  # Received Anchors
  has_many :experience_anchors, through: :experiences, source: :anchors # via other users
  has_many :image_anchors, through: :images, source: :anchors # via other users

  has_many :sent_messages, class_name: 'Message', foreign_key: 'sender_id'
  has_many :received_messages, class_name: 'Message', foreign_key: 'recipient_id'

  def to_param
    "#{id}-#{username.parameterize}"
  end

  def generate_username
    names = %w(oldsalt swashbuckler pirate deckscrubber railmeat bilgecleaner anchordragger marooned scallywag headclogger captainahab deadwood accidentaljiber scuttlebutt dismaster capsized flounder hawsepiper hobbyhorse guppy catfish)

    random_name = names.sample
    number = User.count + 230
    username = "#{random_name}#{number}"

    if User.exists?(username: username)
      self.username = "tridentghost#{number}"
    else
      self.username = username
    end
  end

  def generate_guide
    guides.create!(name: 'My Cruising Guide')
  end

  def self.from_omniauth(auth)
    identity = Identity.find_for_oauth(auth)
    if identity.user # User has account with omniauth identity
      user = identity.user
    elsif basic_user = find_by_email(auth.info.email) # Exisiting User w/o omniauth identity
      user = basic_user
    else # Brand new user with no identity or user account
      user = User.new(
        email: auth.info.email,
        password: Devise.friendly_token[0, 20]
      )
      user.remote_image_url = auth.info.image.gsub('http://', 'https://')
      user.save
      user.add_badge(101)
     end

    # Associate Identity with User
    if identity.user != user
      identity.user = user
      identity.save
    end
    user
  end

  def self.update_oauth
    users = where.not(uid: nil)
    users.each do |_user|
    end
  end

  def analytics_identify
    Analytics.identify(
      user_id: id,
      traits: {
        email: email,
        username: username,
        blog: blog,
        created_at: created_at
      })
  end

  def file_size
    unless image.file.nil?
      if image.file.size.to_f > 5_000_000 # 5 MB
        errors.add(:image, 'cannot be larger than 5 MB')
      end
    end
  end

  def user_time
    time = Time.now
    value = time - created_at
  end

  def full_name
    "#{fname} #{lname}"
  end

  def anchor!(anchorable)
    anchors.create!(anchorable_id: anchorable.id, anchorable_type: anchorable.class.name)
  end

  def unanchor!(anchorable)
    anchor = anchors.where(anchorable_id: anchorable.id, anchorable_type: anchorable.class.name)
    anchor.destroy_all
  end

  def anchor?(anchorable)
    anchor = anchors.where(anchorable_id: anchorable.id, anchorable_type: anchorable.class.name)
    if anchor.empty?
      false
    else
      true
    end
  end

  def has_page?(location)
    pages.find_by_location_id(location.id)
  end

  def total_anchors
    # total anchors received from other users
    image_anchors.count + experience_anchors.count
  end

  def combined_anchors
    # total anchors received from other users
    image_anchors.includes(:user, anchorable: [:location]) + experience_anchors.includes(:user, anchorable: [:location])
  end

  def send_welcome_email
    ActivityMailer.delay_for(5.seconds, retry: false).welcome(id)
    ActivityMailer.delay_for(5.seconds, retry: false).new_user_alert(id)
  end

  def downcase_username
    self.username = username.downcase
  end

  def location_images(location)
    images.where(location_id: location.id).order('RANDOM()').limit(5)
  end
end
