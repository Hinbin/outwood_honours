
module BadgeRequests
  class SendBadgeRequestEmails
    def initialize; end

    def call
      BadgeRequest.where(status: 'active').each do |br|
        BadgeRequestMailer.with(badge_request: br).badge_request_email.deliver_now
      end
    end
  end
end
