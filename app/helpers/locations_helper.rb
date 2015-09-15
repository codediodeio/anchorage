module LocationsHelper

  def experience_link(location)
    if user_signed_in?
      if exp = current_user.experiences.find_by_location_id(location.id)
        edit_experience_path(exp)
      else
        new_experience_path(location_id: location.id)
      end
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
