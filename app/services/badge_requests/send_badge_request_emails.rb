
module BadgeRequests
  class SendBadgeRequestEmails
    def initialize; end

    def call
      BadgeRequest.where(status: 'pending').each do |br|
        BadgeRequestMailer.with(badge_request: br).badge_request_email.deliver_later
        Rails.logger.debug "Sending badge request email to #{br.staff.email} from #{br.student.given_name} #{br.student.family_name} for #{br.badge.name}"
      end
    end
  end
end
