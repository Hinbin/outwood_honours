FactoryBot.define do
  factory :badge_request do
    student { create(:user) }
    staff { create(:staff, school: student.school) }
    comment { FFaker::HipsterIpsum.sentence }
  end
end
