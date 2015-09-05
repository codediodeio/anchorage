class MessagesController < ApplicationController

  respond_to :html, :js

  def index
    @user = current_user
    received_messages = @user.received_messages.pluck(:sender_id).uniq
    sent_messages = @user.sent_messages.pluck(:recipient_id).uniq
    ids = received_messages + sent_messages
    @contacted_users = User.find(ids).paginate(page: params[:page], per_page: 12)
  end

  def show
    @message = Message.new
    @sender = current_user
    @recipient = User.find_by_username(params[:username]) or not_found

    if @sender == @recipient
      redirect_to dashboard_path
    else
      @sent_messages = @sender.sent_messages.where(recipient_id: @recipient.id)
      @received_messages = @sender.received_messages.where(sender_id: @recipient.id).includes(:sender)

      arr = @received_messages + @sent_messages
      @messages = arr.sort_by { |msg| msg.created_at }
    end
  end

  def create
    @sender = current_user
    @message = @sender.sent_messages.build(message_params)

    respond_to do |format|
      if @message.save
        format.html { redirect_to conversation_path(@message.recipient.username), notice: 'Message sent!' }
      else
        format.html { redirect_to conversation_path(@message.recipient.username), alert: 'Failed to Send Message' }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end


  private

  def message_params
    params.require(:message).permit(:recipient_id, :body)
  end
end
