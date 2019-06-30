# frozen_string_literal: true

require 'googleauth'
require 'googleauth/stores/file_token_store'
require 'stringio'

module Google
  class AuthorizeWithGoogle
    def initialize; end

    def call
      authorize_user_in_google
    end

    def authorize_user_in_google
      json_key_io = StringIO.new(ENV['GOOGLE_SERVICE_ACCOUNT'].to_json)

      Google::Auth::ServiceAccountCredentials.make_creds(
        json_key_io: json_key_io,
        scope: Google::Apis::SheetsV4::AUTH_SPREADSHEETS_READONLY
      )
    end
  end
end
