# frozen_string_literal: true

RSpec.describe Badge::SyncUsersWithGoogle, :vcr do

  context 'when syncing user data from Google' do

    it 'authorises a user if currently unauthorised'
    
    it 'sets a user as active by default' do
      described_class.new.call
      expect(User.first.active).to eq(true)
    end

    it 'gets the user data in the user spreadsheet', :focus do
      described_class.new.call
      expect(User.count).to be > 0
    end

    it 'sets the user data'

    it 'sets a user to be a staff member'

    it 'creates schools where needed' do
      described_class.new.call
      expect(School.count).to be > 0
    end

    it 'creates new users where needed' 

    it 'set sets the student to the correct school'

    it 'changes a student school when needed'

    it 'handles post 16 students'

    it 'updates user details when changed'

    it 'sets offroll students to inactive'

    it 'sets the school correctly'

    it 'prevents a school being added that is not on the whitelist'
  end

  it 'updates changed values correctly'
end
