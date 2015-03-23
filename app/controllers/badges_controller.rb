class BadgesController < ApplicationController

  def index
    @badges = Merit::Badge
  end

  def show
    id = (params[:id]).to_i
    @badge = Merit::Badge.find(id)
    @users = @badge.users.paginate(page: params[:page], per_page: 16).order('created_at DESC')
  end

end
