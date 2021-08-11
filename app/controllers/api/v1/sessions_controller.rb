class Api::V1::SessionsController < ApplicationController
  def create
    Api::V1::Users::Service::SignInService.call(params, context)
    return render_error if context[:error]

    render json: { token: context[:token], exp: context[:exp] }, status: :ok
  end

  def destroy
    Api::V1::Users::Service::SignOutService.call(request, context)
    return render_error if context[:error]

    render json: :ok
  end
end
