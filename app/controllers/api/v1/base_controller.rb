class Api::V1::BaseController < ApplicationController
  include JWTSessions::RailsAuthorization
  include Api::V1::Endpoint

  rescue_from JWTSessions::Errors::Unauthorized, with: :not_authorized

  before_action :authenticate_user!

  attr_reader :current_user

  private

  def authenticate_user!
    # authorize_access_request!
    # @current_user = User.find(payload['user_id'])
    @current_user = User.first
  end

  def not_authorized
    context[:error] = :unauthorized
    context[:status] = :unauthorized
    render_error
  end
end
