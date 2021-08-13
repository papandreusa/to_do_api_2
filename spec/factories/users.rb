FactoryBot.define do
  factory :user do
    sequence(:username) { |n| "user#{n}" }
    password { FFaker::Internet.password(10) }
    password_confirmation { password }
  end
end
