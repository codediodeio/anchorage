class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authenticate_admin!
    unless user_signed_in? && current_user.admin?
      redirect_to root_url
      flash[:alert] = "Not Authorized"
    end
  end

  def admin_signed_in?
    user_signed_in? && current_user.try(:admin?)
  end

end
