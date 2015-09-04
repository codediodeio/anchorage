class SitemapsController < ApplicationController
  respond_to :xml

  def sitemap
    @static_pages = ['about_url', 'terms_url', 'privacy_url', 'badges_url', 'signup_url', 'login_url', 'locations_url', 'regions_url']
    @regions = Region.all
    @locations = Location.all
    @users = User.all
  end

end
