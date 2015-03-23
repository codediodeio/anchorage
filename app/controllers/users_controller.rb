class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :dashboard]

  def show

    @user = User.find(params[:id])
    @experiences = @user.experiences.limit(3).order('created_at DESC')
    @images = @user.images.limit(3).order('created_at DESC')
  #  @user = User.find_by_username(params[:username])

  #  if @user.nil?
  #    redirect_to root_url
  #  end
  end

  def dashboard
    @user = current_user
  end

  def experiences
    @user = User.find(params[:id])
    @experiences = @user.experiences.paginate(page: params[:page], per_page: 10).order('created_at DESC')
  end

  def images
    @user = User.find(params[:id])
    @images = @user.images.paginate(page: params[:page], per_page: 16).order('created_at DESC')
  end


end
