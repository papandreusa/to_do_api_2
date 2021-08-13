class Api::V1::BaseController < ApplicationController
  include JWTSessions::RailsAuthorization
  include Api::V1::Endpoint

  before_action :authenticate_user!

  # rescue_from JWTSessions::Errors::Unauthorized, with: :not_authorized

  attr_reader :current_user

  private

  def authenticate_user!
    authorize_access_request!
    @current_user = User.find(payload['user_id'])
  end

end
