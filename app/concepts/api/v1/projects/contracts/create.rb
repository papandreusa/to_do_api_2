class Api::V1::Projects::Contracts::Create < Reform::Form
  property :id
  property :name
  property :user_id

  validation :default do
    params do
      required(:name).filled(:string, min_size?: 4)
    end

    rule(:name) do
      key.failure('must be unique') if Project.where(user_id: values[:user_id]).find_by(name: values[:name])
    end
  end
end
