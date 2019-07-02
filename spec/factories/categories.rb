FactoryBot.define do
  factory :category do
    sequence(:name) { |n| FFaker::HipsterIpsum.word + n.to_s }
    sequence(:external_id)
    description { FFaker::HipsterIpsum.sentence }
  end
end
