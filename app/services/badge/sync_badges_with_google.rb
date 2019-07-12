# frozen_string_literal: true

require 'google/apis/sheets_v4'
class Badge
  class SyncBadgesWithGoogle
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
      @categories = @service.get_spreadsheet_values(ENV['GOOGLE_BADGES_SPREADSHEET'], 'Modules!A2:C')
      @awarders = @service.get_spreadsheet_values(ENV['GOOGLE_BADGES_SPREADSHEET'], 'Awarders!A2:B')
      @badges = @service.get_spreadsheet_values(ENV['GOOGLE_BADGES_SPREADSHEET'], 'Badges!A2:F')
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
          badge_requirement = Badge.unscoped.where(name: b[4]).first
          badge.badge_requirements = [badge_requirement] if badge_requirement.present?
          badge.criteria = b[5]
          badge.save!
        end
      end
    end
  end
end
