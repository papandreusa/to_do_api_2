FactoryBot.define do
  factory :comment do
    body { FFaker::Lorem.sentence }
    task

    trait :with_images do
      images do
        [Rack::Test::UploadedFile.new(Rails.root.join(SpecConstants::Comment::TEST_IMAGE), 'image/jpg')]
      end
    end
  end
end
