class Api::V1::Projects::Contracts::Create < Reform::Form
  property :name

  validation :default do
    params do
      required(:name).filled(:string, min_size?: 4)
    end

    rule(:name) do
      key.failure('must be unique') if Project.where(user_id: user_id).find_by(name: value)
    end
  end
end
