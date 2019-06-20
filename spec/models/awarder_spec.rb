require 'rails_helper'

RSpec.describe Awarder, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:name) }
  it { is_expected.to validate_uniqueness_of(:external_id) }
  
  it { is_expected.to have_many(:badges) }
end
