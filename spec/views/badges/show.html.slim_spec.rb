# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'badges/show', type: :view do
  let(:badge) { create(:badge) }
  let(:student) { create(:student) }
  let(:teachers) { create_list(:staff, 5, school: student.school) }

  before do
    @badge = badge
    @staff = teachers
  end

  context 'when requesting a badge' do
    before do
      sign_in student
    end

    it 'shows the badge name' do
      render
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

    it 'shows an awarder selection box' do
      render
      expect(rendered).to have_select('Awarder')
    end

    it 'shows a comment message box' do
      render
      expect(rendered).to have_input('Comment')
    end
  end


end
