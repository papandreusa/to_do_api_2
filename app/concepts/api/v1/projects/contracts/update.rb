class Api::V1::Projects::Contracts::Update < Reform::Form
  property :name
  validation :default do
    params do
      required(:name).filled
    end
  end
end
