RSpec.describe 'Badge editor edits a badge', type: :feature, js: true do
  let(:badge_editor) { create(:badge_editor) }
  let(:badge) { create(:badge) }
  let(:new_category) { create(:category) }
  let(:new_awarder) { create(:awarder) }
  let(:new_badge_name) { FFaker::HipsterIpsum.word }
  let(:new_fa_icon) { 'check' }

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

    it 'allows me to update the module of the badge' do
      new_category
      visit badge_path(badge)
      select(new_category.name, from: 'badge_category_id')
      click_button 'Update Badge'
      expect(page).to have_css('#badgeCategory', text: new_category.name)
    end

    it 'allows me to update the awarder of the badge' do
      new_awarder
      visit badge_path(badge)
      select(new_awarder.name, from: 'badge_awarder_id')
      click_button 'Update Badge'
      expect(page).to have_css('#badgeAwarder', text: new_awarder.name)
    end

    it 'allows me to edit the icon it uses'do
      visit badge_path(badge)
      fill_in 'badge_icon', with: new_fa_icon
      click_button 'Update Badge'
      expect(page).to have_css("i.fa-#{new_fa_icon}")
    end

    it 'rejects icons that will not load'

    it 'shows an error message if I update the module to be blank'
  end
end
