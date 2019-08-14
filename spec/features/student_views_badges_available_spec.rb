RSpec.describe 'Student views badges available', type: :feature, js: true do
  let(:badges) { create_list(:badge, 10) }
  let(:disabled_badge) { create(:badge, active: false) }
  let(:student) { create(:student) }

  before do
    badges
    sign_in student
  end

  it 'shows badges that are currently available' do
    disabled_badge
    visit(badges_path)
    expect(page).to have_css('.card', count: 10)
  end

  it 'only shows badges I still have to get' do
    create(:awarded_badge, user: student, badge: Badge.first)
    visit(badges_path)
    expect(page).to have_css('.card', count: 9)
  end

  it 'displays a nav bar for the student with a badges link' do
    visit(badges_path)
    expect(page).to have_css("nav a[href='#{badges_path}'")
  end

  it 'shows which badges I have a request in for' do
    
  end
end
