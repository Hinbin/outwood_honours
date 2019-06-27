FactoryBot.define do
  factory :school do
    name { FFaker::Education.school }
    active { true }
  end
end
