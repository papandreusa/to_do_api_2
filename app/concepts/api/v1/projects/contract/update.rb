class Api::V1::Projects::Contract::Update < Reform::Form
  property :id
  property :name
  validation :default do
    params do
      required(:name).filled(:string, min_size?: 4)
      optional(:id)
    end
    rule(:name, :id) do
      key.failure('must be unique') if Project.where.not(id: values[:id]).find_by(name: values[:name])
    end
  end
end
