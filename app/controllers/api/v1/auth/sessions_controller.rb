class Api::V1::Auth::SessionsController < ApplicationController
  include Api::V1::Authentication
  include Api::V1::Endpoint

  before_action :authorize_access_request!, only: :destroy

  def create
    endpoint(operation: Api::V1::Sessions::Operations::Create)
  end

  def destroy
    endpoint(operation: Api::V1::Sessions::Operations::Destroy,
             options: { current_user: current_user, payload: payload })
  end
end
