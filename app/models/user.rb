class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         before_validation :generate_username, on: :create

         validates :username, uniqueness: true

  has_many :experiences
  has_many :images
  has_many :locations, through: :experiences
  has_many :anchors, dependent: :destroy
  has_many :anchored_experiences, through: :anchors, source: :anchorable, source_type: "Experience"
  has_many :anchored_images, through: :anchors, source: :anchorable, source_type: "Image"

  def generate_username
    names = ["oldsalt", "swashbuckler", "pirate", "deckscrubber", "mastclimber", "railmeat"]

    random_name = names.sample
    number = User.count+230
    username = "#{random_name}#{number}"

    if User.exists?(username: username)
      self.username = "trident#{number}"
    else
      self.username = username
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

end
