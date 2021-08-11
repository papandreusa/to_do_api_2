class Api::V1::Users::Service::SignUpService
  def self.call(*args)
    new(*args).call
  end

  def initialize(params, context)
    @params = params
    @context = context.except!(:error)
  end

  def call
    return unless validate
    return unless create_user

    authenticate
  end

  private

  attr_reader :params, :context

  def validate
    contract = Api::V1::Users::Contract::Create.new(User.new)
    context[:error] = :validation_error and return unless contract.validate(user_params)

    true
  end

  def create_user
    User.create!(
      username: params[:username],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
  rescue StandardError
    context[:error] = :creation_error
  end

  def authenticate
    Api::V1::Users::Service::SignInService.call(params, context)
  end

  def user_params
    params.permit(:username, :password)
  end
end
