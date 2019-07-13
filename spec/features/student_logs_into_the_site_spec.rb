require 'support/session_helpers'

RSpec.describe 'Student logs into the site', type: :feature, js: true do
  let(:user_login) { create(:user) }
  let(:different_login) { build(:user) }
  before do
    create_list(:badge, 10)
  end

  context 'when logging in via Google oAuth2' do
    it 'lets a user log in to via Google oAuth2' do
      user_login
      stub_omniauth(user_login)
      visit(root_path)
      click_button('Login')
      expect(page).to have_content(user_login.family_name).and have_content(user_login.given_name)
    end

    it 'redirects a user a the homepage if not logged in' do
      user_login
      visit(badges_path)
      expect(page).to have_current_path(new_user_session_path)
    end

    it 'lets the user know if the account has not been found' do
      user_login
      stub_omniauth(different_login)
      visit(root_path)
      click_button('Login')
      expect(page).to have_content('account has not been found')
    end
  end
end
