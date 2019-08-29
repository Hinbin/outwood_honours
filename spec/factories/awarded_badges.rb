FactoryBot.define do
  factory :awarded_badge do
    badge
    user
    user_comment { FFaker::HipsterIpsum.sentence }
    awarder_comment { FFaker::HipsterIpsum.sentence }
  end
end
