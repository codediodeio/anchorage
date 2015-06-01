# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://anchorage.io"

SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #

  add about_path, :priority => 0.5, :changefreq => 'monthly'
  add privacy_path, :priority => 0.3, :changefreq => 'monthly'
  add terms_path, :priority => 0.3, :changefreq => 'monthly'
  add search_path, :priority => 0.3, :changefreq => 'monthly'
  add signup_path, :priority => 0.3, :changefreq => 'monthly'
  add login_path, :priority => 0.3, :changefreq => 'monthly'

  add blog_path, :priority => 0.5, :changefreq => 'weekly'

  Post.find_each do |post|
    add post_path(post), :lastmod => post.updated_at
  end

  add regions_path, :priority => 0.6, :changefreq => 'weekly'

   Region.find_each do |region|
     add region_path(region), :lastmod => region.updated_at
     add region_map_path(region)
   end

   add locations_path, :priority => 0.8, :changefreq => 'weekly'

  Location.find_each do |location|
    add location_path(location), :lastmod => location.updated_at, :priority => 0.8, :changefreq => 'weekly'
    add location_images_path(location)
    add location_map_path(location)
  end

  add badges_path, :priority => 0.5, :changefreq => 'monthly'

  Merit::Badge.map do |badge|
    add badge_path(id: badge.id, name: badge.name)
  end

  User.find_each do |user|
    add profile_path(user.username)
    add user_images_path(user.username)
    add user_experiences_path(user.username)
  end






end
