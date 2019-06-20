# frozen_string_literal: true

RSpec.describe 'Student views badges available' do
  let(:badge) { create(:badge) }

  before do
    badge
  end
  it 'shows all badges currently avaiable' do
    visit(badges_path)
    expect(page).to contain(badge.description)
  end

  it 'filters badges by category' do
    visit(badges_path)
    select badge.category.name, from: 'Select Module'
    expect(page).to contain(badge.description)
  end

  it 'shows badge icons' do
    visit(badges_path)
    expect(page).to have_css("img#badge-icon-#{badge.id}")
  end
  
end
