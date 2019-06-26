# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'badges/show', type: :view do
  let(:badge) { create(:badge) }

  before(:each) do
    @badge = badge
    render
  end

  it 'shows the badge name' do
    expect(rendered).to match(badge.name)
  end

  it 'renders special characters in the name -/.'

  it 'shows the badge criteria' do
    expect(rendered).to match(badge.criteria)
  end

  it 'shows the badge awarder' do
    expect(rendered).to match(badge.awarder.name)
  end

end
