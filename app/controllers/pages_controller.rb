class PagesController < ApplicationController

  before_action :authenticate_user!

  respond_to :js

  def show
    @user = current_user
    @page = Page.find(params[:id])
    @location = @page.location
    @user_experience = @user.experiences.find_by_location_id(@page.location.id)
    @user_images = @user.images.where(location_id: @page.location.id)
  end

  def create
    @user = current_user
    @location =  Location.find(params[:location_id])
    @guide = @user.guides.find(params[:guide_id])
    @page = @guide.pages.create!(location_id: @location.id)
  end

  def destroy
    @user = current_user
    @location =  Location.find(params[:location_id])
    @guide = @user.guides.find(params[:guide_id])
    @page = @guide.pages.find_by_location_id(@location.id)
    @page.destroy!
  end

end
