class Api::V1::Lib::Step::AuthorizeRequest < Trailblazer::Operation
  include ::JWTSessions::RailsAuthorization

  step ->(options, request:, **) do 
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

  attr_reader :request

end
