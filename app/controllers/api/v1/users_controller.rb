class Api::V1::UsersController < ApplicationController
  def create
    Api::V1::Users::Service::SignUpService.call(params, context)
    return render_error if context[:error]

    render json: { token: context[:token], message: :signup_success }, status: :created
  end
end
