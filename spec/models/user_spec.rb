RSpec.describe User, type: :model do
  it { is_expected.to validate_presence_of(:email) }

  context '#to_label' do
    it 'handles a teacher with no given name'
    it 'handles a teacher with no e-mail'
    it 'handles a teacher with no family name'
  end
end
