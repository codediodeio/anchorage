class AnchorsController < ApplicationController

  respond_to :js

  def anchor
    @user = current_user
    @experience = Experience.find(params[:experience_id])
    @user.anchor!(@experience)
  end

  def unanchor
    @user = current_user
    @anchor = @user.anchors.find_by_anchorable_id(params[:experience_id])
    @experience = Experience.find(params[:experience_id])
    @anchor.destroy!
  end

  def anchor_img
    @user = current_user
    @image = Image.find(params[:image_id])
    @user.anchor!(@image)
  end

  def unanchor_img
    @user = current_user
    @anchor = @user.anchors.find_by_anchorable_id(params[:image_id])
    @image = Image.find(params[:image_id])
    @anchor.destroy!
  end


end
