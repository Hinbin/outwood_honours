# frozen_string_literal: true

namespace :sync_with_google do
  desc 'Sync badges with Google'
  task badges: :environment do
    Badge::SyncBadgesWithGoogle.new.call
  end
end
