# frozen_string_literal: true

RSpec.describe Badge::SyncBadgesWithGoogle, :vcr do
  let(:representation_module) { Category.where(name: 'Representation').first }
  let(:pe_awarder) { Awarder.where(name: 'PE teacher').first }
  let(:first_badge) { Badge.where(external_id: 1).first }
  let(:first_awarder) { Awarder.where(external_id: 1).first }

  context 'when syncing awarder data from Google', :focus, vcr: :all do
    it 'sets the awarder name correctly' do
      described_class.new.call
      expect(first_awarder.name).to eq('PE teacher')
    end
  end

  context 'when syncing badge data from Google' do
    it 'gets the data that is in the badges spreadsheet' do
      described_class.new.call
      expect(Badge.count).to be > 0
    end

    it 'sets the badge category correctly' do
      described_class.new.call
      expect(first_badge.category).to eq(representation_module)
    end

    it 'sets the badge awarder correctly' do
      described_class.new.call
      expect(first_badge.awarder).to eq(pe_awarder)
    end

    it 'sets the badge criteria correctly' do
      described_class.new.call
      expect(first_badge.criteria).to eq('Represent the academy at the regional level for a sporting event')
    end

    it 'sets the badge name correctly' do
      described_class.new.call
      expect(first_badge.name).to eq('Sports Superstar - Regional')
    end
  end

  it 'updates changed values correctly'
end
