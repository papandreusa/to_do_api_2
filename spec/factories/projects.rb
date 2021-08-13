FactoryBot.define do
  factory :project do
    name { FFaker::Lorem.word }
    user { create(:user) }

  end
end
