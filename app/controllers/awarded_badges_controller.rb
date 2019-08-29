class AwardedBadgesController < ApplicationController
  before_action :authenticate_user!

  def index
    @awarded_badges = policy_scope(AwardedBadge).pluck(:badge_id)
    @badges = policy_scope(Badge).includes(:category).where(id: @awarded_badges).order(:category_id)
  end

end
