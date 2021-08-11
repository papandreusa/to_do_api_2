require 'reform/form/dry'
module Api
  module V1
    module Users
      module Contract
        class Create < Reform::Form
          feature Reform::Form::Dry

          property :username
          property :password
          property :password_confirmation

          validation :default do
            params do
              required(:username).filled
              required(:password).filled(min_size?: 4)
            end
          end
        end
      end
    end
  end
end
