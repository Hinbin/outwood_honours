# frozen_string_literal: true

require 'google/apis/sheets_v4'
class User
  class SyncUsersWithGoogle
    USER_SHEET_ID = '18fcQA_KSbo0cuQzHZJvcIAIXdK0OBvXsjJPtJgQHEG4'

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
      @users = @service.get_spreadsheet_values(USER_SHEET_ID, 'Users!A2:E')
    end

    def add_to_database
      @users.values.each do |u|
        User.where(email: u[0]).first_or_initialize do |user|
          user.email = u[0]
          user.family_name = u[1]
          user.given_name = u[3]
          user.role = determine_user_role(user, u[4])
          user.school = determine_user_school(user, u[4])
          user.password = Devise.friendly_token.first(10)
          user.save!
        end
      end
    end

    def determine_user_role(user, orgPath)
      'student'
    end

    def determine_user_school(user, orgPath)
      'Outwood Grange'
    end
  end
end
