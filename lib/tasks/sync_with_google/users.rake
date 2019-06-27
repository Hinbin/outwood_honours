# frozen_string_literal: true

namespace :sync_with_google do
  desc 'Sync users with Google'
  task users: :environment do
    User::SyncUsersWithGoogle.new.call
  end
end
