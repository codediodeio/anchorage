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

  def authenticate_admin!
    unless user_signed_in? && current_user.admin?
      redirect_to root_url
      flash[:alert] = "Not Authorized"
    end
  end

  def not_found
    raise ActionController::RoutingError.new('Page Not Found')
  end

  def redirect_to_back
    if !request.env["HTTP_REFERER"].blank? and request.env["HTTP_REFERER"] != request.env["REQUEST_URI"]
      redirect_to :back
    else
      redirect_to root_url
    end
  end

  def badge_check
    if Merit::Action.where(processed: false).present?
      BadgeWorker.perform_in(3.seconds)
    else
      BadgeWorker.perform_in(1.seconds)
    end
  end

end
