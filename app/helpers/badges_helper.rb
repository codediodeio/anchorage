module BadgesHelper

  def by_difficulty(badges, diff)
    badges.select { |badge|  badge.custom_fields[:difficulty]==diff }
  end

  def by_category(badges, cat)
    badges.select { |badge|  badge.custom_fields[:category]==cat }
  end

end
