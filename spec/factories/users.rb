FactoryBot.define do
  factory :user do
    sequence(:username) { |n| "user#{n}" }
    password { Api::V1::Users::Constants::PASSWORD_REGEX.random_example }
    password_confirmation { password }
  end
end
