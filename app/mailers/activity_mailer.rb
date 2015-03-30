class ActivityMailer < ApplicationMailer

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def welcome(user)
    @user = user
    @username = @user.username
    mail( :to => @user.email, :subject => "Welcome to Anchorage.io" )
  end

end
