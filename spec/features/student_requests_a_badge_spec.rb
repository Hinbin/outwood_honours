RSpec.describe 'Student requests a badge', type: :feature, js: true do
  let(:student) { create(:student) }
  let(:badge) { create(:badge) }
  let(:staff) { create(:staff, school: student.school) }
  let(:comment) { FFaker::HipsterIpsum.sentence }

  before do
    sign_in student
  end

  context 'when requesting a badge' do
    it 'shows teachers from my school' do
      staff
      visit(badge_path(badge))
      expect(page).to have_select('Awarder', options: ['', staff.to_label])
    end

    it 'only shows teachers from my school' do
      create(:staff)
      visit(badge_path(badge))
      expect(page).to have_select('Awarder', options: [''])
    end

    it 'deals with someone not having a school' do
      sign_out student
      sign_in create(:student, school: nil)
      visit(badge_path(badge))
      expect(page).to have_select('Awarder', options: [''])
    end

    it 'shows error messages' do
      visit(badge_path(badge))
      click_button 'Create Badge request'
      expect(page).to have_css('li', text: "Comment can't be blank")
    end
  end

  context 'when viewing the page after requesting a badge' do
    before do
      staff
      visit(badge_path(badge))
      select staff.to_label, from: 'Awarder'
      fill_in 'Comment', with: comment
      click_button 'Create Badge request'
    end

    it 'shows who you have requested the badge from' do
      expect(page).to have_content("You have requested this badge from #{staff.email}").and have_content(comment)
    end

    it 'deals with staff members who then leave' do
      User.find(staff.id).destroy
      visit(badge_path(badge))
    end

    it 'shows the comment I have added' do
      visit(badge_path(badge))
      expect(page).to have_css('#comment', text: comment)
    end

    it 'allows me to remove the request' do
      click_link 'Withdraw Badge Request'
      expect(page).to have_content('Your badge request has been withdrawn')
    end
  end

  context 'when I already have been awarded the badge' do
    let(:awarded_badge) { create(:awarded_badge, badge: badge, user: student) }

    before do
      awarded_badge
    end

    it 'shows I have already been awarded a badge' do
      visit(badge_path(badge))
      expect(page).to have_content("You were awarded this badge on #{awarded_badge.updated_at.to_date.to_formatted_s(:long_ordinal)}")
    end
  end
end
