# frozen_string_literal: true

class Badge < ApplicationRecord
  has_one_attached :badge_image
  belongs_to :awarder
  belongs_to :category
  has_many :badge_requests

  has_and_belongs_to_many :badge_requirements,
                          class_name: 'Badge',
                          join_table: :badge_requirements,
                          foreign_key: :badge_id,
                          association_foreign_key: :badge_requirement_id

  validates :name, presence: true
  validates :criteria, presence: true
  validates :external_id, uniqueness: true, presence: true
end
