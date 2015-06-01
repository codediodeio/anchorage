# Preview all emails at http://localhost:3000/rails/mailers/activity_mailer
class ActivityMailerPreview < ActionMailer::Preview

  def welcome
    ActivityMailer.welcome(User.first.id)
  end

  def first_experience
    ActivityMailer.first_experience(Experience.first)
  end

  def five_anchors
    ActivityMailer.five_anchors(User.first.id)
  end

end
