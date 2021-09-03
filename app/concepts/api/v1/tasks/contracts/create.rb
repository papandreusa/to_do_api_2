class Api::V1::Tasks::Contracts::Create < Reform::Form
  property :name

  validation name: :default do
    params do
      required(:name).filled(:str?)
    end
  end
end
