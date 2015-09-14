class StaticPagesController < ApplicationController

  respond_to :html, :js

  def home
    # @featured = Location.featured.limit(3).includes(:images, :regions) #[228,39,68] #New [228,141,188]
    @experiences = Experience.all.includes(:user, :location).limit(4).order('created_at DESC')
    @images = Image.all.includes(:user, :location).limit(8).order('created_at DESC')
    @masons = (@experiences + @images).sort_by { |m| m.anchors_count }.reverse!
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
