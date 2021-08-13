class Api::V1::SessionsController < ApplicationController
  include Api::V1::Endpoint

  def create
    endpoint(operation: Api::V1::Sessions::Operation::Create)
  end

  def destroy
    endpoint(operation: Api::V1::Sessions::Operation::Destroy, options: { request: request })
  end
end
