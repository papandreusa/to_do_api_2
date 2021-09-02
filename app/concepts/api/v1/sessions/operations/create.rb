class Api::V1::Sessions::Operations::Create < Trailblazer::Operation
  step Model(User, :find_by, :username)
  step :authenticate
  step :create_session
  step :get_token

  def authenticate(ctx, params:, **)
    ctx[:model].authenticate(params[:password])
  end

  def create_session(ctx, **)
    ctx[:session] = JWTSessions::Session.new(payload: { user_id: ctx[:model].id }, refresh_by_access_allowed: true)
  end

  def get_token(ctx, **)
    ctx[:data] = ctx[:session].login
  end
end
