# frozen_string_literal: true

class Badge < ApplicationRecord
  before_save :default_values

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
  validates_inclusion_of :active, in: [true, false]
  validates :external_id, uniqueness: true, presence: true
  validates :banner, length: { maximum: 11 }

  enum inner_colour: %i[yellow orange pink red purple teal blue blue-dark
                        green green-dark silver gold black white], _prefix: :inner_
  enum icon_colour: %i[yellow orange pink red purple teal blue blue-dark
                       green green-dark silver gold black white], _prefix: :icon_

  def default_values
    self.icon = 'question' if icon.nil?
    self.inner_colour = 0 if inner_colour.nil?
    self.icon_colour = 0 if icon_colour.nil?
    self.level = 1 if level.nil?
    self.active = true if active.nil?
  end
end
