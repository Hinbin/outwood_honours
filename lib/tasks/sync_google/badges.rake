# frozen_string_literal: true

namespace :sync_google do
  desc 'Removing old challenges'
  task badges: :environment do
    Badge::SyncBadgesFromGoogle.new.call
  end
end
