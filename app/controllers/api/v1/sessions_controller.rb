class Api::V1::SessionsController < ApplicationController
  include Api::V1::Sessions
  include Api::V1::Endpoint

  def create
    endpoint(operation: Operations::Create)
  end

  def destroy
    endpoint(operation: Operations::Destroy, options: { request: request })
  end
end
