class UsersController < ApplicationController
  before_action :set_user, only: [:show, :experiences, :images]
  before_action :authenticate_user!, only: [:dashboard, :anchors, :edit_password, :update_password, :anchors_given, :anchors_received, :locations]

  def show
    @experiences = @user.experiences.limit(3).order('created_at DESC').includes(:location)
    @images = @user.images.limit(3).order('created_at DESC').includes(:location)
  end

  def dashboard
    @user = current_user
    @anchors = @user.anchors.limit(5).order('created_at DESC')
    @guides = @user.guides.limit(5).order('created_at DESC')
  end

  def experiences
    @experiences = @user.experiences.paginate(page: params[:page], per_page: 9).order('created_at DESC').includes(:location)
  end

  def images
    @images = @user.images.paginate(page: params[:page], per_page: 9).order('created_at DESC').includes(:location)
  end

  def anchors
    @user = current_user
    @anchors = @user.anchors.paginate(page: params[:page], per_page: 20).order('created_at DESC').includes(anchorable: [:user, :location])
    @anchors_received = @user.combined_anchors.sort_by(&:created_at).reverse.paginate(page: params[:page], per_page: 20)
  end

  def anchors_received
    @user = current_user
    @anchors_received = @user.combined_anchors.sort_by(&:created_at).reverse.paginate(page: params[:page], per_page: 50)
  end

  def anchors_given
    @user = current_user
    @anchors = @user.anchors.paginate(page: params[:page], per_page: 50).order('created_at DESC').includes(anchorable: [:user, :location])
  end

  def locations
    @user = current_user
    @locations = @user.locations.includes(:regions).paginate(page: params[:page], per_page: 20).order('created_at DESC')
  end

  def edit_password
   @user = current_user
  end

 def update_password
   @user = User.find(current_user.id)
   if @user.update(user_params)
     sign_in @user, :bypass => true
     redirect_to dashboard_path
     flash[:notice] = "Password updated successfully."
   else
     redirect_to newpassword_path
     flash[:error] = "Unable to update password, please try again."
   end
 end

 private

 def set_user
   @user = User.find_by_username(params[:username]) or not_found
 end

 def user_params
   params.required(:user).permit(:password, :password_confirmation, :current_password)
 end

end
