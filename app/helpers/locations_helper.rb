module LocationsHelper

  def experience_link(location)
    if user_signed_in?
      new_experience_path(location_id: location.id)
    else
      signup_path
    end
  end

  def photo_link(location)
    if user_signed_in?
      new_location_image_path(location)
    else
      signup_path
    end
  end


end
