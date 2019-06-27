# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { FFaker::Internet.email }
    password { FFaker::Internet.password }
    provider { 'google_oauth2' }
    uid { rand(0..10_000) }
    role { rand(0..1) }
    active { true }

    factory :student do
      role { 'student' }
    end

    factory :staff do
      role { 'staff' }
    end
  end
end
