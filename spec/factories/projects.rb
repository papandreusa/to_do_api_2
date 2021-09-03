FactoryBot.define do
  factory :project do
    sequence(:name) { |n| "project ##{n}" }
    user

    trait :with_tasks do
      after(:create) do |project|
        create_list(:task, 2, project: project)
      end
    end
  end
end
