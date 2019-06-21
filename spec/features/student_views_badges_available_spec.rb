# frozen_string_literal: true

RSpec.describe 'Student views badges available' do
  let(:badge) { create(:badge) }

  before do
    badge
  end
 
  it 'filters badges by category' do
    select badge.category.name, from: 'Select Module'
    expect(rendered).to contain(badge.description)
  end
end
