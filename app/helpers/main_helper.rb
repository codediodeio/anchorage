module MainHelper

  def source_label(object)
    if object == "Experience"
      '<span class="label label-warning">experience</span>'
    elsif object == "Image"
      '<span class="label label-pink">image</span>'
    end
  end

  def nearby(array, location)
    array.map do |stat|
      x = Stat.find(stat[0])
      location.calc_distance(stat[1], stat[2])
    end
  end

  def headline_generator(experience)
    words = ["adventure at", "time at", "journey to", "trip at", "experience at"]
    random_word = words[experience.id%4]
    "@#{experience.user.username}'s #{random_word} #{experience.location.name}"
  end

end
