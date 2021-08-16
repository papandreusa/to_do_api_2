class Api::V1::Sessions::Operations::Create < Trailblazer::Operation
  step :find_user!
  step :authenticate!
  step :create_session!
  step :get_token

  def find_user!(options, params:, **)
    @user = options[:model] = User.find_by(username: params[:username])
  end

  def authenticate!(options, params:, **)
    options[:model].authenticate(params[:password])
  end

  def create_session!(_options, **)
    @session = JWTSessions::Session.new(payload: payload, refresh_by_access_allowed: true)
  end

  def get_token(options, **)
    options[:data] = @session.login
  end

  private

  attr_reader :user, :session

  def payload
    @payload ||= { user_id: user.id }
  end
end
