FactoryBot.define do
  factory :category do
    name { FFaker::HipsterIpsum.word }
  end
end
