# frozen_string_literal: true

class BadgesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_badge, only: %i[show update]
  before_action :set_badge_request, only: %i[show update]

  # GET /badges
  # GET /badges.json
  def index
    @awarded_badges = policy_scope(AwardedBadge).pluck(:badge_id)

    @badge_requests = policy_scope(BadgeRequest).where(student: current_user).pluck(:badge_id, :status)

    @badges = policy_scope(Badge).left_outer_joins(:badge_requests)
                                 .where('badge_requests.student_id is null', current_user.id)
                                 .where.not(id: @awarded_badges)
  end

  # GET /badges/1
  # GET /badges/1.json
  def show
    authorize @badge
    @staff = User.where(role: 'staff', school: current_user.school)
    @awarded_badge = AwardedBadge.where(user: current_user, badge: @badge).first
  end

  def update
    authorize @badge
    @badge.update(update_badge_params)
    @badge.save
    render 'show'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_badge
    @badge = Badge.find(params[:id])
  end

  def badge_params
    params.permit(:staff_id, :comment)
  end

  def update_badge_params
    params.require(:badge).permit(:name, :category_id, :awarder_id, :icon, :inner_colour,
                                  :icon_colour, :criteria, :banner, :level)
  end

  def set_badge_request
    @badge_request = BadgeRequest.where(student: current_user, badge: @badge).first_or_initialize
    return if @badge_request.persisted?

    return unless badge_params.present?

    @badge_request.assign_attributes(badge_params)
    @badge_request.valid?
  end
end
