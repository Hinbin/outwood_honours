# frozen_string_literal: true

require 'google/apis/sheets_v4'
require 'googleauth'
require 'googleauth/stores/file_token_store'
require 'fileutils'

class Badge
  class SyncBadgesFromGoogle
    OOB_URI = 'urn:ietf:wg:oauth:2.0:oob'
    APPLICATION_NAME = 'Google Sheets API Ruby Quickstart'
    CREDENTIALS_PATH = 'credentials.json'
    # The file token.yaml stores the user's access and refresh tokens, and is
    # created automatically when the authorization flow completes for the first
    # time.
    TOKEN_PATH = 'token.yaml'
    SCOPE = Google::Apis::SheetsV4::AUTH_SPREADSHEETS_READONLY

    BADGES_SHEET_ID = '1qNso27BVEdbzy1nsl5OkATnues5SvZhdXeqdt4M4M44'

    def initialize
      initialize_google_sheet_api
    end

    def call
      download_spreadsheet_data
      add_to_database
      OpenStruct.new(success?: true, errors: nil)
    end

    def download_spreadsheet_data
      @categories = @service.get_spreadsheet_values(BADGES_SHEET_ID, 'Modules!A2:C')
      @awarders = @service.get_spreadsheet_values(BADGES_SHEET_ID, 'Awarders!A2:B')
      @badges = @service.get_spreadsheet_values(BADGES_SHEET_ID, 'Badges!A2:F')
    end

    def add_to_database
      @categories.values.each do |c|
        Category.where(external_id: c[0]).first_or_initialize do |category|
          category.name = c[1]
          category.description = c[2]
          category.save!
        end
      end

      @awarders.values.each do |a|
        Awarder.where(external_id: a[0]).first_or_initialize do |awarder|          
          awarder.name = a[1]
          awarder.save!
        end
      end

      @badges.values.each do |b|
        Badge.where(external_id: b[0]).first_or_initialize do |badge|
          badge.category = Category.where(name: b[1]).first
          badge.name = b[2]
          badge.awarder = Awarder.where(name: b[3]).first
          # adjust to work with multiple badges
          required_badges = Badge.unscoped.where(name: b[4]).first
          badge.required_badges = [required_badges] if required_badges.present?
          badge.criteria = b[5]
          badge.save!
        end
      end
    end

    def authorize_user_in_google
      client_id = Google::Auth::ClientId.from_file(CREDENTIALS_PATH)
      token_store = Google::Auth::Stores::FileTokenStore.new(file: TOKEN_PATH)
      authorizer = Google::Auth::UserAuthorizer.new(client_id, SCOPE, token_store)
      user_id = 'default'
      credentials = authorizer.get_credentials(user_id)
      if credentials.nil?
        url = authorizer.get_authorization_url(base_url: OOB_URI)
        puts 'Open the following URL in the browser and enter the ' \
             "resulting code after authorization:\n" + url
        code = gets
        credentials = authorizer.get_and_store_credentials_from_code(
          user_id: user_id, code: code, base_url: OOB_URI
        )
      end
      credentials
    end

    def initialize_google_sheet_api
      @service = Google::Apis::SheetsV4::SheetsService.new
      @service.client_options.application_name = APPLICATION_NAME
      @service.authorization = authorize_user_in_google
    end
  end
end
