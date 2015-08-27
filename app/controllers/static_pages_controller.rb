class StaticPagesController < ApplicationController

  def home
    @featured = Location.featured.limit(3).includes(:images, :regions) #[228,39,68] #New [228,141,188]
  end

  def about
  end

  def terms
  end

  def privacy
  end

  def search
    @search = Location.search do
      fulltext params[:keyword]
    end

    @locations = @search.results

    @keyword = params[:keyword].to_s.downcase
  end

end
