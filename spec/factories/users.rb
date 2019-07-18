# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { FFaker::Internet.email }
    password { FFaker::Internet.password }
    provider { 'google_oauth2' }
    uid { rand(0..10_000) }
    role { rand(0..1) }
    active { true }
    given_name { FFaker::Name.first_name }
    family_name { FFaker::Name.last_name }
    school

    factory :student do
      role { 'student' }
    end

    factory :staff do
      role { 'staff' }
    end

    factory :badge_editor do
      after(:create) { |user| user.add_role(:badge_editor) }
    end

    factory :super_admin do
      after(:create) { |user| user.add_role(:super_admin) }
    end
  end
end
