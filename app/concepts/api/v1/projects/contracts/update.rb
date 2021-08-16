class Api::V1::Projects::Contracts::Update < Reform::Form
  property :id
  property :name
  property :user_id
  validation :default do
    params do
      required(:name).filled(:string, min_size?: 4)
      optional(:id)
    end
    rule(:name, :id) do
      if Project.where(user_id: values[:user_id]).where.not(id: values[:id]).find_by(name: values[:name])
        key.failure('must be unique')
      end
    end
  end
end
