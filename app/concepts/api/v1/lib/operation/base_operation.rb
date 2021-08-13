class Api::V1::Lib::Operation::BaseOperation < Trailblazer::Operation
  include ::JWTSessions::RailsAuthorization
  include ::Pundit

  step :authorize_request!
  step :set_current_user!

  def authorize_request!(options, request:, **)
    @request = request
    authorize_access_request!
    payload
  rescue JWTSessions::Errors::Unauthorized
    options[:status] = :unauthorized
    false
  end

  def set_current_user!(options, **)
    @current_user = options[:current_user] = User.find(payload['user_id'])
  end

  private

  attr_reader :request, :current_user
end
