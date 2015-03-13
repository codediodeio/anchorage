class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         before_validation :generate_username

  def generate_username
    names = ["salty", "swashbuckler", "pirate", "deckscrubber", "mastclimber", "elcapitan"]

    random_name = names.sample
    number = User.count+230

    self.username = "#{random_name}#{number}"

  end

end
