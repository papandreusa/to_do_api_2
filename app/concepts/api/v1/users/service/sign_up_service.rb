class Api::V1::Users::Service::SignUpService
  def self.call(*args)
    new(*args).call
  end

  def initialize(context, params)
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
    context[:error] = contract.errors.messages and return unless contract.validate(params)

    true
  end

  def contract
    @contract ||= Api::V1::Users::Contract::Create.new(User.new)
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
    Api::V1::Sessions::Service::SignInService.call(context, params)
  end
end
