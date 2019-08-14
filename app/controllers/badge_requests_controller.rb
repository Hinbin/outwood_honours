# frozen_string_literal: true

class BadgeRequestsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_badge_request, only: %i[show update destroy]

  def create
    badge_request = BadgeRequest.create(badge_request_params)
    badge_request.status = 'pending'
    authorize badge_request

    badge_request.save
    redirect_to badge_path(badge_request.badge, badge_request_params.to_h)
  end

  def index
    @badge_requests = policy_scope(BadgeRequest).where(status: 'pending')
  end

  def update
    @badge_request.status = badge_update_params
    authorize @badge_request

    BadgeRequest::AwardBadge.new(@badge_request).call if @badge_request.status == 'approved'
    @badge_request.save! if @badge_request.status == 'denied'
  end

  def destroy
    authorize @badge_request

    badge = @badge_request.badge
    @badge_request.destroy
    flash[:alert] = 'Your badge request has been withdrawn'
    redirect_to badge
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_badge_request
    @badge_request = BadgeRequest.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def badge_request_params
    params.require(:badge_request).permit(:staff_id, :student_id, :badge_id, :comment)
  end

  def badge_update_params
    params.require(:status)
  end
end
