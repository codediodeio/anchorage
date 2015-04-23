class StaticPagesController < ApplicationController

  def home
    @featured = Location.find([228,39,68])
    #@featured = Location.featured #[228,39,68]
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
