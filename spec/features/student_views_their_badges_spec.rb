RSpec.describe 'Student views badges available', type: :feature, js: true do
  let(:awarded_badge) { create(:awarded_badge, user: student) }
  let(:student) { create(:student) }

  before do
    awarded_badge
    sign_in student
  end

  it 'shows badges that I have been awarded' do
    visit(awarded_badges_path)
    expect(page).to have_css('.card', count: 1)
  end

end
