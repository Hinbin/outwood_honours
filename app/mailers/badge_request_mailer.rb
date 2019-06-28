class BadgeRequestMailer < ApplicationMailer
  def badge_request_email
    @badge_request = params[:badge_request]
    mail(to: @badge_request.staff.email, subject: 'You have a badge to approve!')
  end
end
