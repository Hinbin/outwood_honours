RSpec.describe 'Student searches', type: :feature, js: true do
  context 'when using a search box' do
    before do
      sign_in create(:student)
      create_list(:badge, 10)
    end

    it 'only shows badges whose titles match what is typed in' do
      visit badges_path
      fill_in('badgeSearch', with: Badge.first.name)
      expect(page).to have_css('.card', count: 1)
    end

    it 'allows me to filter by module' do
      visit badges_path
      select(Badge.first.category.name, from: 'moduleSelect')
      expect(page).to have_css('.card', count: 1)
    end

  end
end
