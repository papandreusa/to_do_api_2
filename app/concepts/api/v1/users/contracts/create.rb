require 'reform/form/dry'
class Api::V1::Users::Contracts::Create < Reform::Form
  include Api::V1::Users
  feature Reform::Form::Dry

  property :username
  property :password
  property :password_confirmation, virtual: true

  validation name: :default do
    params do
      required(:username).filled(min_size?: Constants::USERNAME_MIN, max_size?: Constants::USERNAME_MAX)
      required(:password).filled
      required(:password_confirmation)
    end

    rule(:username) do
      key.failure(I18n.t('errors.be_unique')) if User.find_by(username: value)
    end

    rule(:password) do
      key.failure(I18n.t('errors.invalid_format')) unless Constants::PASSWORD_REGEX.match?(value)
    end

    rule(:password_confirmation) do
      key.failure(I18n.t('errors.the_same_as', field: :password)) if values[:password] != values[:password_confirmation]
    end
  end
end
