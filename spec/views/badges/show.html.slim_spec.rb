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
    subject { render }

    before do
      sign_in student
      render
    end

    it { is_expected.to have_content(badge.name) }
    it { is_expected.to have_content(badge.criteria) }
    it { is_expected.to have_content(badge.awarder.name) }
    it { is_expected.to have_field('Comment') }
    it { is_expected.to have_no_css('#editBadgeSection') }

    it 'renders special characters in the name -/.' do
      character_string = '-\\+.@#!'
      @badge.name = character_string
      render
      expect(rendered).to have_content(character_string)
    end
  end

  context 'when editing a badge with an editor role' do
    subject { render }

    let(:badge_editor) { create(:badge_editor) }

    before do
      sign_in badge_editor
      render
    end

    it { is_expected.to have_css('#editBadgeSection') }
  end
end
