class Api::V1::BaseController < ApplicationController
  include Api::V1::Authentication
  include Api::V1::Endpoint

  before_action :authorize_access_request!

  private

  def endpoint_options
    { params: params, current_user: current_user }
  end
end
