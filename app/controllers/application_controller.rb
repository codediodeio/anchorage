class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :banned?

  def banned?
    if current_user.present? && current_user.banned?
      sign_out current_user
      flash[:error] = "This account has been suspended. Please contact us for more info"
      root_path
    end
  end

  def redirect_to(options = {}, response_status = {})
   ::Rails.logger.error("Redirected by #{caller(1).first rescue "unknown"}")
   super(options, response_status)
  end

  def authenticate_admin!
    unless user_signed_in? && current_user.admin?
      redirect_to root_url
      flash[:alert] = "Not Authorized"
    end
  end

  def admin_signed_in?
    user_signed_in? && current_user.try(:admin?)
  end
=begin
  def after_sign_in_path_for(resource)
    sign_in_url = new_user_session_url
    if request.referer == sign_in_url
      super
    else
      stored_location_for(resource) || request.referer || root_path
    end
  end
=end
end
