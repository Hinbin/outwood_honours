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

  def badge_requested?(badge)
    return false unless @badge_requests.present?

    @badge_requests.select { |s| s[0] == badge.id && s[1] == 'pending' }.present?
  end

  def badge_denied?(badge)
    return false unless @badge_requests.present?

    @badge_requests.select { |s| s[0] == badge.id && s[1] == 'denied' }.present?
  end
end
