require 'rails_helper'

RSpec.describe BadgeRequest, type: :model do
  let(:badge_request) { create(:badge_request, student: student) }
  let(:student) { create(:student) }

  it { is_expected.to validate_presence_of(:comment) }

  context 'when saving' do
    it 'stops four or more requests for one student' do
      create_list(:badge_request, 3, student: student)
      expect{badge_request}.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'allows up to three badge requests per user' do
      create_list(:badge_request, 2, student: student)
      expect(badge_request).to be_valid
    end

    it 'staff members only for the request' do
      expect(build(:badge_request, staff: student)).not_to be_valid
    end

    it 'does not allow a badge to be denied without a comment' do
      expect(build(:badge_request, status: 'denied', awarder_comment: nil)).not_to be_valid
    end

    it 'checks the badges prerequisites'
  end
end
