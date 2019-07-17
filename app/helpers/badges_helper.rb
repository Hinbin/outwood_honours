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

  def badge_icon(badge)
    icons = %w[baseball-ball basketball-ball biking bowling-ball cat chess chess-bishop chess-board chess-king chess-knight chess-pawn chess-queen chess-rook crow dog dollar-sign donate dove dragon dumbbell feather feather-alt fish football-ball frog futbol futbol gift globe golf-ball hand-holding-heart hand-holding-usd hands-helping handshake handshake heart heart hippo hockey-puck horse horse-head kiwi-bird leaf otter parachute-box paw piggy-bank quidditch ribbon running seedling skating skiing skiing-nordic snowboarding spider square-full swimmer table-tennis volleyball-ball]

    "fa fa-#{icons[badge.id % 60]} text-white"
  end

  def badge_awarded?(badge)
    @awarded_badges.present? && (@awarded_badges.include? badge.id)
  end
end
