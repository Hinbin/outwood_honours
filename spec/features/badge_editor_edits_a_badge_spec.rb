RSpec.describe 'Badge editor edits a badge', type: :feature, js: true do
  let(:badge_editor) { create(:badge_editor) }
  let(:badge) { create(:badge) }
  let(:new_badge_name) { FFaker::HipsterIpsum.word }

  before do
    sign_in badge_editor
  end

  context 'when editing a badge' do
    it 'allows me to change the name of the badge' do
      visit badge_path(badge)
      fill_in 'badge_name', with: new_badge_name
      click_button 'Update Badge'
      expect(page).to have_css('#badgeName', exact_text: new_badge_name)
    end
  end
end
