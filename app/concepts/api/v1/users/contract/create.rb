require 'reform/form/dry'
module Api
  module V1
    module Users
      module Contract
        class Create < Reform::Form
          feature Reform::Form::Dry

          property :username
          property :password
          property :password_confirmation, virtual: true

          validation :default do
            params do
              required(:username).filled
              required(:password).filled(min_size?: 4)
              required(:password_confirmation)
            end
            rule(:username) do
              key.failure('must be unique') if User.find_by(username: value)
            end

            rule(:password_confirmation) do
              key.failure('must be same as password') if values[:password] != values[:password_confirmation]
            end
          end
        end
      end
    end
  end
end
