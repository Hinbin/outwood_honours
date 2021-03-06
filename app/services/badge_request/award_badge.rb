class BadgeRequest
  class AwardBadge
    def initialize(badge_request)
      @badge_request = badge_request
      @badge = badge_request.badge
      @student = badge_request.student
    end

    def call
      award_student_with_badge
      remove_badge_request
    end

    private

    def award_student_with_badge
      AwardedBadge.create(user: @student, badge: @badge, user_comment: @badge_request.comment,
                          awarder_comment: @badge_request.awarder_comment)
    end

    def remove_badge_request
      @badge_request.destroy
    end
  end
end
