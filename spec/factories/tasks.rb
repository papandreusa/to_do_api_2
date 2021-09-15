FactoryBot.define do
  factory :task do
    sequence(:name) { |n| "task ##{n}" }
    position { 1 }
    done { false }
    project

    trait :with_comments do
      after(:create) do |task|
        create_list(:comment, 2, task: task)
      end
    end
  end
end
