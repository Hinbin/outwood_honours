# frozen_string_literal: true

class BadgesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_badge, only: %i[show]

  # GET /badges
  # GET /badges.json
  def index
    @badges = Badge.all
  end

  # GET /badges/1
  # GET /badges/1.json
  def show; end

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
