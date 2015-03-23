class PagesController < ApplicationController
  def home
  end

  def about
  end

  def terms
  end

  def privacy
  end

  def search
    @locations = Location.search(params)
    @keyword = params[:keyword].to_s.downcase
  end

end
