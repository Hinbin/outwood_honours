# frozen_string_literal: true

class BadgesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_badge, only: %i[show]

  # GET /badges
  # GET /badges.json
  def index
    @badges = Badge.includes(:category).all
    @awarded_badges = AwardedBadge.where(user: current_user).pluck(:badge_id)
  end

  # GET /badges/1
  # GET /badges/1.json
  def show
    @staff = User.where(role: 'staff', school: current_user.school)
    @awarded_badge = AwardedBadge.where(user: current_user, badge: @badge).first
    @badge_request = BadgeRequest.where(student: current_user, badge: @badge).first
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_badge
    @badge = Badge.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def badge_params
    params.fetch(:badge, {})
  end
end
