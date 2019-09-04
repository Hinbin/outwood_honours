RSpec.describe 'Staff deals with badge requests', type: :feature, js: true do
  let(:staff) { create(:staff) }
  let(:student) { create(:student) }
  let(:badge_request) { create(:badge_request, student: student, staff: staff) }
  let(:comment) { FFaker::HipsterIpsum.sentence }

  before do
    sign_in staff
    badge_request
  end

  it 'works when navigating from badges - turbolinks bug'

  context 'when approving a badge request' do
    it 'shows when I have submitted an approval' do
      visit(badge_requests_path)
      click_button 'Approve'
      expect(page).to have_css('i.fa-check')
    end

    it 'prevents students from accessing the page' do
      sign_out staff
      sign_in student
      visit(badge_requests_path)
      expect(page).to have_current_path(root_path)
    end

    context 'when seeing the result as a student' do
      before do
        visit(badge_requests_path)
        find('.awarder-comment').fill_in with: comment
        click_button 'Approve'
        sign_out staff
        sign_in student
      end

      it 'shows the awarder comment to the student' do
        visit(badge_path(badge_request.badge))
        expect(page).to have_content(comment)
      end
    end
  end

  context 'when denying a badge request', :focus do
    it 'allows the awarder to deny a request' do
      visit(badge_requests_path)
      find('.awarder-comment').fill_in with: comment
      click_button 'Deny'
      expect(page).to have_css('i.fa-check')
    end

    it 'only allows me to deny a request with a comment' do
      visit(badge_requests_path)
      find('.awarder-comment').fill_in with: comment
      click_button 'Deny'
      expect(page).to have_content('You must provide a comment when denying a request')
    end

    context 'when seeing the result as a student' do
      before do
        visit(badge_requests_path)
        find('.awarder-comment').fill_in with: comment
        click_button 'Deny'
        sign_out staff
        sign_in student
      end

      it 'records the awarder comment' do
        visit(badge_path(badge_request.badge))
        expect(page).to have_content(comment)
      end

      it 'allows the student to withdraw and re-request the badge' do
        visit(badge_path(badge_request.badge))
        click_button 'Withdraw Badge Request'
        expect(page).to have_button('Create Badge Request')
      end
    end
  end
end
