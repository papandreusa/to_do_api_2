FactoryBot.define do
  factory :project do
    sequence(:name) { |n| "project ##{n}" }
    user

    transient do
      tasks_size { 2 }
    end

    trait :with_tasks do
      after(:create) do |project, evaluator|
        create_list(:task, evaluator.tasks_size, project: project)
      end
    end
  end
end
