# frozen_string_literal: true

class BadgeRequestsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_badge_request, only: %i[show]

  def create
    badge_request = BadgeRequest.create(badge_request_params)
    badge_request.status = 'pending'
    badge_request.save
    redirect_to badge_request.badge
  end

  # GET /badges
  # GET /badges.json
  def index
    @badges = Badge.all
  end

  # GET /badges/1
  # GET /badges/1.json
  def show
    @teachers = User.where(role: 'staff', school: current_user.school)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_badge_request
    @badge = BadgeRequest.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def badge_request_params
    params.require(:badge_request).permit(:staff_id, :student_id, :badge_id, :comment)
  end
end
