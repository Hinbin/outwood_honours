# frozen_string_literal: true

module BadgesHelper
  def level_shape(level)
    level = 0 if level.nil?

    shapes = %w[circle-badge square-badge hex-badge]

    shapes[(level % 3) - 1]
  end

  def category_colour(num)
    colours = %w[blue-dark green red teal pink
                 silver orange yellow pink green-dark]

    colours[num % 10]
  end

  def badge_awarded?(badge)
    @awarded_badges.present? && (@awarded_badges.include? badge.id)
  end
end
