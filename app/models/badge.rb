# frozen_string_literal: true

class Badge < ApplicationRecord
  has_one_attached :badge_image
  belongs_to :awarder
  belongs_to :category

  has_and_belongs_to_many :required_badges,
                          class_name: 'Badge',
                          join_table: :required_badges,
                          foreign_key: :badge_id,
                          association_foreign_key: :required_badge_id

  validates :name, presence: true
  validates :criteria, presence: true
end
