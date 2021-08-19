class Api::V1::Projects::Contracts::Create < Reform::Form
  property :name

  validation name: :default do
    params do
      required(:name).filled
    end
  end
end
