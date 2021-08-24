module Api::V1::Authentication
  extend ActiveSupport::Concern
  include JWTSessions::RailsAuthorization

  included do
    rescue_from JWTSessions::Errors::Unauthorized, with: :not_authorized
  end

  private

  def not_authorized
    render status: :unauthorized
  end

  def current_user
    @current_user ||= User.find(payload['user_id'])
  end
end
