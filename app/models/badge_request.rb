class BadgeRequest < ApplicationRecord
  belongs_to :student, class_name: 'User', foreign_key: 'student_id'
  belongs_to :staff, class_name: 'User', foreign_key: 'staff_id'
  belongs_to :badge

  enum status: %i[pending approved denied inactive]

  attribute :status, :integer, default: 'pending'
end
