class Api::V1::Lib::Operations::Authenticate < Trailblazer::Operation
  include ::JWTSessions::RailsAuthorization
  include ::Pundit

  pass :setup
  step :authorize_request!
  step :set_current_user!

  def setup(_options, params:, request:, **)
    @params = params
    @request = request
  end

  def authorize_request!(options, **)
    authorize_access_request!
    payload
  rescue JWTSessions::Errors::Unauthorized
    options[:status] = :unauthorized
    false
  end

  def set_current_user!(options, **)
    options[:current_user] = User.find(payload['user_id'])
  end

  private

  attr_reader :params, :request
end
