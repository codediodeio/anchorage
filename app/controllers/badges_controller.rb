class BadgesController < ApplicationController

  def index
    @badges = Merit::Badge.keys
  end

  def show
    id = (params[:id]).to_i
    @badge = Merit::Badge.find(id)
  end

end
