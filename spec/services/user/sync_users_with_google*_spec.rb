# frozen_string_literal: true

require 'support/session_helpers'

RSpec.describe User::SyncUsersWithGoogle, :vcr, type: :feature do
  context 'when syncing user data from Google' do
    before do
      setup_school_database
    end

    it 'authorises a user if currently unauthorised'

    it 'gets the user data in the user spreadsheet' do
      described_class.new.call
      expect(User.count).to be > 0
    end

    context 'with student records' do
      let(:student_email) { 's31665@student.outwood.com' }
      let(:student_record) { User.where(email: student_email).first }
      let(:student_school) { School.where(name: 'Outwood Grange').first }

      it 'sets the student data' do
        described_class.new.call
        expect(User.where(email: student_email).count).to eq(1)
      end

      it 'sets a user to be a student' do
        described_class.new.call
        expect(student_record.role).to eq('student')
      end

      it 'assigns a student to a schools where needed' do
        described_class.new.call
        expect(student_record.school).to eq(student_school)
      end

      it 'assigns a student with a school to be active' do
        described_class.new.call
        expect(student_record.active).to eq(true)
      end

      it 'updates a student school' do
        create(:user, email: student_email, school: create(:school))
        described_class.new.call
        expect(student_record.school).to eq(student_school)
      end
    end

    context 'with staff data' do
      let(:staff_email) { 'n.houlton@grange.outwood.com' }
      let(:staff_record) { User.where(email: staff_email).first }

      it 'sets the role to staff' do
        described_class.new.call
        expect(staff_record.role).to eq('staff')
      end
    end

    context 'with invalid data' do
      let(:offroll_email) { 's31389@student.outwood.com' }
      let(:offroll_record) { User.where(email: offroll_email).first }

      it 'assigns a student with no school when needed' do
        described_class.new.call
        expect(offroll_record.school).to eq(nil)
      end

      it 'sets a student with no school to inactive' do
        described_class.new.call
        expect(offroll_record.active).to eq(false)
      end

      it 'updates a student who is offroll to inactive' do
        create(:user, email: offroll_email)
        described_class.new.call
        expect(offroll_record.active).to eq(false)
      end
    end
  end
end
