class GuidePdf < Prawn::Document
  def initialize(guide)
    super(top_margin: 70)
    @guide = guide
    title
    contents
    pages
    footer
  end

  def title
    font("Courier") do
      text "#{@guide.name}", size: 30, style: :bold
      text "Created by #{@guide.user.username}. Powered by Anchorage.io", size: 15, style: :bold
    end
    move_down 30
  end

  def contents
    font("Courier") do
      text "Table of Contents", size: 20, style: :bold
      move_down 10
      @guide.pages.each do |p|
        move_down 10
        text "- #{p.location.name}"
      end
    end
  end

  def pages
    @guide.pages.each do |page|
      start_new_page
      font("Courier") do
        text "#{page.location.name}", size: 25, style: :bold
        text "#{ActionView::Base.full_sanitizer.sanitize(page.location.stat.description)}"
        move_down 10

        text "Key Stats", size: 20, style: :bold
        text "Type: #{page.location.stat.ltype}"
        text "Latitude: #{page.location.stat.lat}"
        text "Longitude: #{page.location.stat.long}"
        text "Slips Available: #{page.location.stat.slips}"
        text "Moorings: #{page.location.stat.moorings}"
        text "Protection Start: #{page.location.stat.pstart} deg true"
        text "Protection End: #{page.location.stat.pend} deg true"
        text "(note: protection is estimated by working from start to end in a clockwise motion)"

        move_down 10

        text "First Hand Experiences", size: 20, style: :bold

        if page.experiences.any?
          page.experiences.each do |exp|
            text "#{exp.user.username}'s experience at #{exp.location.name}", size: 15, style: :bold
            text "#{ActionView::Base.full_sanitizer.sanitize(exp.body)}"
            move_down 10
          end

        else
          text "No First-Hand Experiences Anchored for this Location"
        end

        move_down 20

        text "Photos", size: 20, style: :bold

        if page.images.any?
          page.images.each do |img|
              image open("#{img.file_url(:thumb)}"), width: 250, height: 250
              move_down 5
              text "credit: #{img.user.username}"
          end
          move_down 10

        else
          text "No Photos Anchored for this Location"
        end

      end

    end
  end

  def footer
    start_new_page
    font("Courier") do
      text "The End!", size: 35, style: :bold, :align => :center
      move_down 25
      text "Thanks for using Anchorage.io", size: 25, style: :bold, :align => :center
      move_down 25
      text "Have a safe and memorable voyage", size: 15, style: :bold, :align => :center
  end
  end

end
