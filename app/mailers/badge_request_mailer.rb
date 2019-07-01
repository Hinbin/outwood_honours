class BadgeRequestMailer < ApplicationMailer
  def badge_request_email
    @user = params[:user]
    @badge_requests = BadgeRequest.where(staff: @user, status: 'pending')
    mail(to: @user.email, subject: 'You have a badge to approve!')
  end
end
