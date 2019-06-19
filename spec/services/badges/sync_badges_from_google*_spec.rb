# frozen_string_literal: true

RSpec.describe Badge::SyncBadgesFromGoogle do
  context 'when syncing information from Google' do
    it 'gets the data that is in the badges spreadsheet' do
      result = described_class.new.call
      expect(result.badges).to exist
    end
  end
end
