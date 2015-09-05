class ActivityMailer < ApplicationMailer

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def welcome(user_id)
    @id = user_id
    @user = User.find(@id)
    @username = @user.username
    mail( :to => @user.email, :subject => "Welcome to Anchorage.io" )
  end

  def new_user_alert(user_id)
    @id = user_id
    @user = User.find(@id)
    mail( :to => "hello@anchorage.io", :subject => "New User for Anchorage.io" )
  end

  def first_experience(exp_id)
    @id = exp_id
    @exp = Experience.find(exp_id)
    @user = @exp.user
    @location = @exp.location
    if @user.experiences.first.id == @exp.id
      mail( :to => @user.email, :subject => "You Shared your First Experience" )
    end
  end

  def five_anchors(user_id)
    @id = user_id
    @user = User.find(@id)
    @anchor_count = @user.total_anchors
    if @anchor_count == 5
      mail( :to => @user.email, :subject => "You're Getting So Popular!" )
    end
  end

  def message_received(message_id)
    @message = Message.find(message_id)
    @user = @message.recipient
    @sender = @message.sender
      mail( :to => @user.email, :subject => "New Message from #{@sender.username} - Do Not Reply" )
  end

end
