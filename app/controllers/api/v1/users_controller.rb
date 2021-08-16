class Api::V1::UsersController < ApplicationController
  include Api::V1::Endpoint

  def create
    endpoint operation: Api::V1::Users::Operations::Create
  end
end
