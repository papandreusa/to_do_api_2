class Api::V1::Lib::Operations::Authenticate < Api::V1::Lib::Operations::BaseOperation
  include ::JWTSessions::RailsAuthorization
  include ::Pundit

  step :authorize_request!
  step :set_current_user!

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
end
