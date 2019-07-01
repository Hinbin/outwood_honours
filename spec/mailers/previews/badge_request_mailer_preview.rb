# Preview all emails at http://localhost:3000/rails/mailers/badge_request_mailer
class BadgeRequestMailerPreview < ActionMailer::Preview
  def badge_request_email
    BadgeRequestMailer.with(user: User.first).badge_request_email
  end
end
