RSpec.describe 'Student views badges available', type: :feature, js: true do
  let(:badges) { create_list(:badge, 10) }
  let(:student) { create(:student) }

  before do
    badges
    sign_in student
  end

  it 'shows badges that are currently available' do
    visit(badges_path)
    expect(page).to have_css('.card', count: 10)
  end

  it 'highlights which badges I have got' do
    create(:awarded_badge, user: student)
    visit(badges_path)
    expect(page).to have_css('.card.bg-success', count: 1)
  end

  it 'displays a nav bar for the student with a badges link' do
    visit(badges_path)
    expect(page).to have_css("nav a[href='#{badges_path}'")
  end
end
