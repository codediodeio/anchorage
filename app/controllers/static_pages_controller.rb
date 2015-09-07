class StaticPagesController < ApplicationController

  respond_to :html, :js

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
    @query = params[:keyword].to_s
    @locations = Location.search(@query).includes(:regions, :stat).paginate(page: params[:page], per_page: 12)
    @keyword = @query.downcase
    @results_count = @locations.count
  end

end
