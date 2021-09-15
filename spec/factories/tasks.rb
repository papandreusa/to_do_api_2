FactoryBot.define do
  factory :task do
    sequence(:name) { |n| "task ##{n}" }
    position { 1 }
    done { false }
    project
  end
end
