# frozen_string_literal: true

class BadgeRequestsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_badge_request, only: %i[show, update]

  def create
    badge_request = BadgeRequest.create(badge_request_params)
    badge_request.status = 'pending'
    badge_request.save
    redirect_to badge_request.badge
  end

  # GET /badges
  # GET /badges.json
  def index
    @badge_requests = BadgeRequest.where(staff_id: current_user.id, status: 'pending')
  end

  def update
    @badge_request.status = badge_update_params
    BadgeRequest::AwardBadge.new(@badge_request).call if @badge_request.status == 'approved'
    @badge_request.save! if @badge_request.status == 'denied'
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
