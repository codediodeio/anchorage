class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:dashboard, :anchors, :edit_password, :update_password]

  def show

    @user = User.find(params[:id])
    @experiences = @user.experiences.limit(3).order('created_at DESC')
    @images = @user.images.limit(3).order('created_at DESC')
  end

  def dashboard
    @user = current_user
    @anchors = @user.anchors.limit(5).order('created_at DESC')
    @guides = @user.guides.limit(5).order('created_at DESC')
  end

  def experiences
    @user = User.find(params[:id])
    @experiences = @user.experiences.paginate(page: params[:page], per_page: 9).order('created_at DESC')
  end

  def images
    @user = User.find(params[:id])
    @images = @user.images.paginate(page: params[:page], per_page: 9).order('created_at DESC')
  end

  def anchors
    @user = current_user
    @anchors = @user.anchors.paginate(page: params[:page], per_page: 20).order('created_at DESC')
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

 def user_params
   params.required(:user).permit(:password, :password_confirmation, :current_password)
 end

end
