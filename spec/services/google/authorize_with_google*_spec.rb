RSpec.describe Google::AuthorizeWithGoogle, :vcr do

  context 'when authorizing with google' do
    it 'authenicates successfully' do
      result = described_class.new.call
      expect(result).to_not be(nil)
    end
  end
end