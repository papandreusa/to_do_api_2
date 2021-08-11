class Api::V1::RefreshController < ApplicationController
  include JWTSessions::RailsAuthorization
  before_action :authorize_refresh_by_access_request!

  def create
    session = JWTSessions::Session.new(payload: access_payload)
    render json: session.refresh(found_token)
  end

  def access_payload
    build_access_payload_based_on_refresh(payload)
  end
end
