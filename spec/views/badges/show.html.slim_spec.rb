# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'badges/show', :focus, type: :view do
  let(:badge) { create(:badge) }
  let(:teachers) { create_list(:staff, 5, school: create(:school)) }

  before(:each) do
    @badge = badge
    @staff = teachers
    render
  end

  it 'shows the badge name' do
    expect(rendered).to have_content(badge.name)
  end

  it 'renders special characters in the name -/.' do
    character_string = '-\\+.@#!'
    @badge.name = character_string
    render
    expect(rendered).to have_content(character_string)
  end

  it 'shows the badge criteria' do
    expect(rendered).to have_content(badge.criteria)
  end

  it 'shows the badge awarder' do
    expect(rendered).to have_content(badge.awarder.name)
  end

  context 'when requesting a badge' do
    it 'shows a selection box' do
      expect(rendered).to have_content('select#teacher_select')
    end

    it 'shows a message box' do
      expect(rendered).to have_css('input#badge_select')
    end
  end
end
