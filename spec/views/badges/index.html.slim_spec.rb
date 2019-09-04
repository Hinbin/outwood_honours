# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'badges/index', type: :view do
  let(:badge_one) { create(:badge) }
  let(:badge_two) { create(:badge) }
  let(:student) { create(:user) }

  before do
    sign_in student
    assign(:badges, [
      badge_one,
      badge_two
    ])
    render
  end

  it 'shows all badges currently avaiable' do
    expect(rendered).to have_content(badge_one.name)
  end

  it 'shows badges' do
    expect(rendered).to have_css('.honours-badge')
  end
end
