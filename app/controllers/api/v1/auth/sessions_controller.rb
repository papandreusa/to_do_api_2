class Api::V1::Auth::SessionsController < ApplicationController
  include Api::V1::Authentication
  include Api::V1::Endpoint
  include Api::V1::Sessions

  before_action :authorize_access_request!, only: :destroy

  def create
    endpoint(operation: Operations::Create)
  end

  def destroy
    endpoint(operation: Operations::Destroy, options: { current_user: current_user, payload: payload })
  end
end
