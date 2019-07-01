module BadgeRequests
  class SendBadgeRequestEmails
    def initialize
      @users = User.joins('INNER JOIN badge_requests ON users.id = badge_requests.staff_id')
                   .where('badge_requests.status = ?', '0')
    end

    def call
      send_mails_to_users_with_requests
    end

  private

    def send_mails_to_users_with_requests
      @users.each do |u|
        BadgeRequestMailer.with(user: u).badge_request_email.deliver_now
      end
    end
  end
end
