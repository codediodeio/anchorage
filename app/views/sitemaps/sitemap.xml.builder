xml.instruct! :xml, :version => "1.0"
xml.urlset("xmlns"=>"http://www.sitemaps.org/schemas/sitemap/0.9") do

  # Static Pages

  xml.url do
    xml.loc root_url protocol: 'https'
  end

  @static_pages.each do |page|
    xml.url do
      xml.loc send(page, protocol: 'https')
    end
  end

  @locations.each do |location|
    xml.url do
      xml.loc location_url(location, protocol: 'https')
    end
    xml.url do
      xml.loc location_map_url(location, protocol: 'https')
    end
    xml.url do
      xml.loc location_images_url(location, protocol: 'https')
    end
  end

  @regions.each do |region|
    xml.url do
      xml.loc region_url(region, protocol: 'https')
    end
  end

  @users.each do |user|
    xml.url do
      xml.loc profile_url(user.username, protocol: 'https')
    end
    xml.url do
      xml.loc user_images_url(user.username, protocol: 'https')
    end
    xml.url do
      xml.loc user_experiences_url(user.username, protocol: 'https')
    end
  end

  Merit::Badge.map do |badge|
    xml.url do
      xml.loc badge_url(id: badge.id, name: badge.name, protocol: 'https')
    end
  end

end
