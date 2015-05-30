module MainHelper

  def source_label(object)
    if object == "Experience"
      '<span class="label label-warning">experience</span>'
    elsif object == "Image"
      '<span class="label label-pink">image</span>'
    end
  end

end
