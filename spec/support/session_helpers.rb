# frozen_string_literal: true

module SessionHelpers
  def stub_omniauth(user)
    OmniAuth.config.logger = Rails.logger
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:google_oauth2] =
      OmniAuth::AuthHash.new(
        'info' => {
          'provider' => 'google_oauth2',
          'uid' => user.uid,
          'email' => user.email
        }
      )
  end
end
