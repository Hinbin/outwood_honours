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
      Google::Auth::ServiceAccountCredentials.make_creds(
        scope: Google::Apis::SheetsV4::AUTH_SPREADSHEETS_READONLY
      )
    end
  end
end
