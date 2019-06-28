class BadgeRequirement < ApplicationRecord
  belongs_to :badge
  belongs_to :required_badge, class_name: 'Badge'
end
