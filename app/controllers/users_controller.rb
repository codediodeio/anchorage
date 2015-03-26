class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :dashboard]

  def show

    @user = User.find(params[:id])
    @experiences = @user.experiences.limit(3).order('created_at DESC')
    @images = @user.images.limit(3).order('created_at DESC')
  end

  def dashboard
    @user = current_user
    @anchors = @user.anchors.limit(5).order('created_at DESC')
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


end
