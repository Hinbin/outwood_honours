class BadgeRequest < ApplicationRecord
  validate :check_max_requests
  validate :check_staff_member

  belongs_to :student, class_name: 'User', foreign_key: 'student_id'
  belongs_to :staff, class_name: 'User', foreign_key: 'staff_id'
  belongs_to :badge

  enum status: %i[pending approved denied inactive]

  validates :comment, presence: true

  attribute :status, :integer, default: 'pending'

  private

  def check_max_requests
    return unless BadgeRequest.where(student: student, status: 'pending').count > 3

    errors.add(:base, 'you are allowed a maximum of three open badge requests')
  end

  def check_staff_member
    return unless staff.present?
    return if staff.role == 'staff'

    errors.add(:base, 'you are not allowed to assign a badge request to a student')
  end
end
