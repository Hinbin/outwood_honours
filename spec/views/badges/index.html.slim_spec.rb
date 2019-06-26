# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'badges/index', type: :view do

  let(:badge_one) { create(:badge) }
  let(:badge_two) { create(:badge) }
  let(:student) { create(:user) }

  before(:each) do
    sign_in student
    assign(:badges, [
             badge_one,
             badge_two
           ])
    render
  end

  it 'shows all badges currently avaiable' do
    expect(rendered).to match(badge_one.name)
  end

  it 'shows badge icons' do
    expect(rendered).to have_css("img#badge-icon-#{badge_one.id}")
  end
end
