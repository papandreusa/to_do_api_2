class Api::V1::Users::Service::SignOutService
  include ::JWTSessions::RailsAuthorization

  def self.call(*args)
    new(*args).call
  end

  def initialize(request, context)
    @request = request
    @context = context.except!(:error)
  end

  def call
    sign_out
  end

  private

  attr_reader :request, :context

  def sign_out
    authorize_access_request!
    session = JWTSessions::Session.new(payload: payload)
    session.flush_by_access_payload
  rescue JWTSessions::Errors::InvalidPayload
    context[:error] = :invalid_payload
  end
end
