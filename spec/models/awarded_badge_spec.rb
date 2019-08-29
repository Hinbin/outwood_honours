require 'rails_helper'

RSpec.describe AwardedBadge, type: :model do
  it { is_expected.to belong_to(:badge) }
  it { is_expected.to belong_to(:user) }
end
