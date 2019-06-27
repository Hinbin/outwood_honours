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

  def setup_school_database
    grange = create(:school, name: 'Outwood Grange')
    city = create(:school, name: 'Outwood City Academy')
    cityfields = create(:school, name: 'Outwood City Fields')
    create(:school_organisation_path, org_path: '/Students/Secondary/grange', school: grange)
    create(:school_organisation_path, org_path: '/Students/Secondary/city', school: city)
    create(:school_organisation_path, org_path: '/Students/Secondary/cityfields', school: cityfields)
  end
end
