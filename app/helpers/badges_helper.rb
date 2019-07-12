# frozen_string_literal: true

module BadgesHelper
  def random_image(badge)
    images = ['calculator.png', 'hands.png', 'idea.png', 'music.png',
              'write.png', 'brain.png', 'france.png', 'chemistry.png',
              'geography.png']

    image_tag(images[badge.id % images.length], id: "badge-icon-#{badge.id}",
                                                class: 'd-flex mx-auto img-fluid' )
  end

  def badge_awarded? (badge)
    @awarded_badges.present? && (@awarded_badges.include? badge.id)
  end
end
