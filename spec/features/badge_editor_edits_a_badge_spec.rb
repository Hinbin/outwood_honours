require 'rails_helper'

RSpec.describe 'Badge editor edits a badge', type: :feature, js: true do
  let(:badge_editor) { create(:badge_editor) }
  let(:badge) { create(:badge) }
  let(:level_one_badge) { create(:badge, level: 1) }

  let(:new_category) { create(:category) }
  let(:new_awarder) { create(:awarder) }
  let(:new_badge_name) { FFaker::HipsterIpsum.word }
  let(:new_fa_icon) { 'check' }
  let(:new_criteria) { FFaker::HipsterIpsum.sentence }
  let(:new_banner) { FFaker::HipsterIpsum.word.first(11) }
  let(:inner_colour_option) { page.first("#badge_inner_colour > option:nth-child(#{rand(2..10)})").value }
  let(:icon_colour_option) { page.first("#badge_icon_colour > option:nth-child(#{rand(2..10)})").value }
  let(:icon_option) { 'dog' }

  before do
    sign_in badge_editor
  end

  context 'when editing a badge' do
    it 'updates the name' do
      visit badge_path(badge)
      fill_in 'badge_name', with: new_badge_name
      click_button 'Update Badge'
      expect(page).to have_css('#badgeName', exact_text: new_badge_name)
    end

    it 'updates the module' do
      new_category
      visit badge_path(badge)
      select(new_category.name, from: 'badge_category_id')
      click_button 'Update Badge'
      expect(page).to have_css('#badgeCategory', exact_text: new_category.name)
    end

    it 'updates the criteria' do
      visit badge_path(badge)
      fill_in 'badge_criteria', with: new_criteria
      click_button 'Update Badge'
      expect(page).to have_css('#badgeCriteria', exact_text: new_criteria)
    end

    it 'updates the awarder' do
      new_awarder
      visit badge_path(badge)
      select(new_awarder.name, from: 'badge_awarder_id')
      click_button 'Update Badge'
      expect(page).to have_css('#badgeAwarder', text: new_awarder.name)
    end

    it 'updates the inner colour' do
      visit badge_path(badge)
      select(inner_colour_option, from: 'badge_inner_colour')
      click_button 'Update Badge'
      expect(page).to have_css(".current-badge #innerColour.#{inner_colour_option}")
    end

    it 'updates the icon' do
      visit badge_path(badge)
      fill_in 'badge_icon', with: new_fa_icon
      click_button 'Update Badge'
      expect(page).to have_css(".current-badge i.fa-#{new_fa_icon}")
    end

    it 'updates the level' do
      level_one_badge
      visit badge_path(level_one_badge)
      select '3', from: 'badge_level'
      click_button 'Update Badge'
      expect(page).to have_css('.current-badge .hex-badge')
    end

  end

  context 'when previewing a badge' do
    it 'changes the inner colour in the editor' do
      visit badge_path(badge)
      select(inner_colour_option, from: 'badge_inner_colour')
      expect(page).to have_css(".badge-preview #innerColour.#{inner_colour_option}")
    end

    it 'changes the icon colour in the editor' do
      visit badge_path(badge)
      select(icon_colour_option, from: 'badge_icon_colour')
      expect(page).to have_css(".badge-preview i.#{icon_colour_option}-icon")
    end

    it 'changes the icon in the editor' do
      visit badge_path(badge)
      fill_in 'badge_icon', with: icon_option
      expect(page).to have_css(".badge-preview i.fa.fa-#{icon_option}")
    end

    it 'changes the text on the banner' do
      visit badge_path(badge)
      fill_in 'badge_banner', with: new_banner
      expect(page).to have_css('.badge-preview .banner', exact_text: new_banner.upcase)
    end

    it 'hides the banner if there is no text banner value' do
      badge.banner = new_banner
      visit badge_path(badge)
      fill_in 'badge_banner', with: ''
      expect(page).to have_no_css('.badge-preview .banner')
    end

    it 'changes the level' do
      level_one_badge
      visit badge_path(level_one_badge)
      select '2', from: 'badge_level'
      expect(page).to have_css('.badge-preview .square-badge')
    end
  end

  it 'rejects icons that will not load'
end
