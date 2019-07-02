# frozen_string_literal: true

FactoryBot.define do
  factory :badge do
    sequence(:name) { |n| FFaker::HipsterIpsum.words(2).join(' ') + n.to_s }
    sequence(:external_id)
    category
    awarder
    criteria { FFaker::HipsterIpsum.sentence }
  end
end
