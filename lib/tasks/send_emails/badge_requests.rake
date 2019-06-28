# frozen_string_literal: true

namespace :send_emails do
  desc 'Send badge request e-mails'
  task badge_requests: :environment do
    BadgeRequests::SendBadgeRequestEmails.new.call
  end
end
