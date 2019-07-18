# frozen_string_literal: true

module BadgesHelper
  def badge_maker(badge)
    shapes = %w[circle-badge square-badge hex-badge]

    "honours-badge #{badge_colour(badge.category_id % 10)} #{shapes[badge.id % 3]}"
  end

  def badge_colour(num)
    colours = %w[blue-dark green red teal pink
                 silver orange yellow pink green-dark]

    colours[num % 10]
  end

  def badge_awarded?(badge)
    @awarded_badges.present? && (@awarded_badges.include? badge.id)
  end
end
