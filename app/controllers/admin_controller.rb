class AdminController < ApplicationController

  before_action :authenticate_admin!


  respond_to :html, :js

  def dashboard
    @users = User.all.limit(10).order('created_at DESC')
    @locations = Location.all.limit(10).order('created_at DESC')
    @regions = Region.all.limit(10).order('created_at DESC')
    @experiences = Experience.all.limit(10).order('created_at DESC')
    @images = Image.all.limit(10).order('created_at DESC')
  end

  def regions
    @regions = Region.all.paginate(page: params[:page], per_page: 30).order('created_at DESC')
  end

  def experiences
    @experiences = Experience.all.paginate(page: params[:page], per_page: 30).order('created_at DESC')
  end

  def images
    @images = Image.all.paginate(page: params[:page], per_page: 30).order('created_at DESC')
  end

  def locations
    @locations = Location.all.paginate(page: params[:page], per_page: 30).order('created_at DESC')
  end

  def users
    @users = User.all.paginate(page: params[:page], per_page: 30).order('created_at DESC')
  end

  def anchors
    @anchors = Anchor.all.paginate(page: params[:page], per_page: 30).order('created_at DESC')
  end

  def destroy_user
    @user = User.find(params[:id])
  end

  def ban
    @user = User.find(params[:id])
    @user.banned=true
    @user.save
  end

  def lift_ban
    @user = User.find(params[:id])
    @user.banned=false
    @user.save
  end

end
