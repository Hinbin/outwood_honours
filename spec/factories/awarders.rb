FactoryBot.define do
  factory :awarder do
    name { FFaker::HipsterIpsum.word }
    sequence(:external_id)
  end
end
