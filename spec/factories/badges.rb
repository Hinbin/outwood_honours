# frozen_string_literal: true

FactoryBot.define do
  factory :badge do
    name { FFaker::HipsterIpsum.words(2) }
    sequence(:external_id)
    category
    awarder
    criteria { FFaker::HipsterIpsum.sentence }
  end
end
