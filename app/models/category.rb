class Category < ApplicationRecord
  has_many :badges
  validates :name, presence: true, uniqueness: true
  validates :external_id, presence: true, uniqueness: true
  validates :description, presence: true
end
