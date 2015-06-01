class AnchorsController < ApplicationController
  after_action :badge_check

  respond_to :js

  def anchor
    @user = current_user
    @experience = Experience.find(params[:experience_id])
    @anchor = @user.anchor!(@experience)
  end

  def unanchor
    @user = current_user
    @experience = Experience.find(params[:experience_id])
    @user.unanchor!(@experience)
  end

  def anchor_img
    @user = current_user
    @image = Image.find(params[:image_id])
    @anchor = @user.anchor!(@image)
  end

  def unanchor_img
    @user = current_user
    @image = Image.find(params[:image_id])
    @user.unanchor!(@image)
  end

end
