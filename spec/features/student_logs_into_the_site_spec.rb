require 'rails_helper'

RSpec.describe 'Student logs into the site', type: :feature, js: true do
  let(:user_login) { create(:user) }
  let(:different_login) { build(:user) }

  before do
    create_list(:badge, 10)
    user_login
  end

  # context 'when logging in via Google oAuth2' do
  #   it 'lets a user log in to via Google oAuth2' do
  #     stub_omniauth(user_login)
  #     visit(root_path)
  #     click_button('Login')
  #     expect(page).to have_content(user_login.family_name).and have_content(user_login.given_name)
  #   end

  #   it 'redirects a user a the homepage if not logged in' do
  #     visit(badges_path)
  #     expect(page).to have_current_path(new_user_session_path)
  #   end

  #   it 'lets the user know if the account has not been found' do
  #     stub_omniauth(different_login)
  #     visit(root_path)
  #     click_button('Login')
  #     expect(page).to have_content('account has not been found')
  #   end

  #   it 'lets me close an alert' do
  #     stub_omniauth(user_login)
  #     visit(root_path)
  #     find('button.close').click
  #     expect(page).to have_no_content('Successfully authenticated')
  #   end
  # end
end
