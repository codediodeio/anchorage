module UsersHelper

  def by_difficulty(badges, diff)
    badges.select { |badge|  badge.custom_fields[:difficulty]==diff }
  end

end
