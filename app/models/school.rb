class School < ApplicationRecord
  has_many :school_organisation_paths
  has_many :users

  validates :name, presence: true
end
