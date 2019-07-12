# frozen_string_literal: true

require 'google/apis/sheets_v4'
class User
  class SyncUsersWithGoogle
    def initialize
      @service = Google::Apis::SheetsV4::SheetsService.new
      @service.client_options.application_name = 'Outwood Honours'
      @service.authorization = Google::AuthorizeWithGoogle.new.call
    end

    def call
      download_spreadsheet_data
      add_to_database
      OpenStruct.new(success?: true, errors: nil)
    end

    def download_spreadsheet_data
      @users = @service.get_spreadsheet_values(ENV['GOOGLE_USER_SPREADSHEET'], 'Users!A2:E')
    end

    def add_to_database
      @users.values.each do |u|
        user = User.where(email: u[0]).first_or_initialize
        user.email = u[0]
        user.family_name = u[1]
        user.given_name = u[3]
        user.active = true
        user.role = determine_user_role(user, u[4])
        user.school = determine_user_school(user, u[4])
        user.password = Devise.friendly_token.first(10) if user.encrypted_password.blank?

        user.save! if user.changed?
      end
    end

    def determine_user_role(user, orgPath)
      if orgPath.match(/offRoll/)
        user.active = false
        'inactive'
      elsif orgPath.match(/Staff/)
        'staff'
      elsif orgPath.match(/Student/)
        'student'
      else
        user.active = false
        'inactive'
      end
    end

    def determine_user_school(user, orgPath)
      school = SchoolOrganisationPath.where(org_path: orgPath).first
      if school.present?
        school.school
      else
        user.active = false
        nil
      end
    end
  end
end
