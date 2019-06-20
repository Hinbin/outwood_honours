# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Badge, type: :model do
  subject { FactoryBot.create(:badge) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:criteria) }
  it { is_expected.to validate_presence_of(:external_id) }

  it { is_expected.to validate_uniqueness_of(:external_id) }

  it { is_expected.to belong_to(:awarder) }
  it { is_expected.to belong_to(:category) }
  it { is_expected.to have_and_belong_to_many(:required_badges) }
end
