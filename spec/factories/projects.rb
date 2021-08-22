FactoryBot.define do
  factory :project do
    sequence(:name) { |n| "project ##{n}" }
    user
  end
end
