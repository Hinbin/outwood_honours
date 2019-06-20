FactoryBot.define do
  factory :category do
    name { FFaker::HipsterIpsum.word }
    sequence(:external_id)
    description { FFaker::HipsterIpsum.sentence }
  end
end
