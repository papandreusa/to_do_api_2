class Api::V1::Auth::SessionsController < ApplicationController
  include Api::V1::Endpoint
  include Api::V1::Sessions

  def create
    endpoint(operation: Operations::Create)
  end

  def destroy
    endpoint(operation: Operations::Destroy, options: { request: request })
  end
end
