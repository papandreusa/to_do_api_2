class Api::V1::Sessions::Service::SignInService
  def self.call(*args)
    new(*args).call
  end

  def initialize(context, params)
    @params = params
    @context = context.except!(:error)
  end

  def call
    find_user
    sign_in
  end

  private

  attr_reader :params, :context

  def sign_in
    return context[:error] = :not_authorized unless user || user.authenticate(params[:password])

    context[:current_user] = user
    context[:token] = session.login
  end

  def user
    @user ||= User.find_by(username: params[:username])
  end

  def payload
    @payload ||= { user_id: user.id }
  end

  def session
    @session ||= JWTSessions::Session.new(payload: payload, refresh_by_access_allowed: true)
  end
end
