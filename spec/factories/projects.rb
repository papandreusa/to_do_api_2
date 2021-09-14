FactoryBot.define do
  factory :project do
    sequence(:name) { |n| "project ##{n}" }
    user

    trait :with_tasks do
      after(:create) do |project, evaluator|
        create_list(:task, evaluator.tasks_count || 2, project: project)
      end
    end
  end
end
