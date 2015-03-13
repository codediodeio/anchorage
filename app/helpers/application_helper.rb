module ApplicationHelper

  def page_title(title)
    if title.empty?
      "Community-Powered Cruising Guide for Boaters"
    else
      title
    end
  end

end
