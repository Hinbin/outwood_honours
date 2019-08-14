class ApplicationController < ActionController::Base
  include Pundit
  after_action :verify_authorized, except: :index, unless: :devise_controller?
  after_action :verify_policy_scoped, only: :index
  protect_from_forgery

  def verify_authorized
    return if controller_name == 'pages'
    return if devise_controller?

    super
  end
end
