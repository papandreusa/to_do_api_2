require 'reform/form/dry'
class Api::V1::Users::Contracts::Create < Reform::Form
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
