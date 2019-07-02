FactoryBot.define do
  factory :awarder do
    sequence(:name) { |n| FFaker::HipsterIpsum.word + n.to_s }
    sequence(:external_id)
  end
end
