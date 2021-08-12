class Api::V1::BaseController < ApplicationController
  include JWTSessions::RailsAuthorization
  include Api::V1::Endpoint

  rescue_from JWTSessions::Errors::Unauthorized, with: :not_authorized

  before_action :authenticate_user!

  private

  def authenticate_user!
    authorize_access_request!
    context[:current_user] = User.find(payload['user_id'])
  end

end
