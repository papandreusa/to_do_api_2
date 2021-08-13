class Api::V1::Lib::Operation::Authenticate < Trailblazer::Operation
  include ::JWTSessions::RailsAuthorization

  step :authorize_request!
  step :set_current_user!

  def authorize_request!(options, request:, **) 
    @request = request
    authorize_access_request!
    payload
  rescue JWTSessions::Errors::Unauthorized
    options[:status] = :unauthorized
    false
  rescue JWTSessions::Errors::Expired
    options[:status] = :expired
    false
  end
   
  def set_current_user!(options, **)
    options[:current_user] = User.find(payload['user_id'])
  end

  attr_reader :request
end
