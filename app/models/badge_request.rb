class BadgeRequest < ApplicationRecord
  validate :check_max_requests, on: :create
  validate :check_staff_member
  validate :check_denied_comment

  belongs_to :student, class_name: 'User', foreign_key: 'student_id'
  belongs_to :staff, class_name: 'User', foreign_key: 'staff_id'
  belongs_to :badge

  enum status: %i[pending approved denied inactive]

  validates :comment, presence: true

  attribute :status, :integer, default: 'pending'

  private

  def check_max_requests
    return if BadgeRequest.where(student: student, status: 'pending').count < 3

    errors.add(:base, 'you are allowed a maximum of three open badge requests')
  end

  def check_staff_member
    return unless staff.present?
    return if staff.role == 'staff'

    errors.add(:base, 'you are not allowed to assign a badge request to a student')
  end

  def check_denied_comment
    return unless status == 'denied'
    return if awarder_comment.present?

    errors.add(:base, 'you must add a comment if this request will be denied')
  end

end
