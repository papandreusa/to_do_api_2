module Api
  module V1
    module Projects
      module Contract
        class Update < Reform::Form
          property :name

          validation :default do
            params do
              required(:name).filled(:string, min_size?: 4)
            end

            rule(:name, :id) do
              key.failure('must be unique') if Project.where.not(id: values[:id]).find_by(name: values[:name])
            end
          end
        end
      end
    end
  end
end
