module MessagesHelper

  def who_said?(message)
    if message.sender_id == current_user.id
      "You"
    else
      message.sender.username
    end
  end

  def message_class(message)
    if message.sender_id == current_user.id
      "blue-flag"
    else
      "yellow-flag"
    end
  end


end
