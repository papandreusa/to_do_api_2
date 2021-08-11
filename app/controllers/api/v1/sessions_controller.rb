class Api::V1::SessionsController < ApplicationController
  def create
    Api::V1::Sessions::Service::SignInService.call(context, params)
    return render_error if context[:error]

    render json: { token: context[:token], exp: context[:exp] }, status: :ok
  end

  def destroy
    Api::V1::Sessions::Service::SignOutService.call(context, request)
    return render_error if context[:error]

    render json: :ok
  end
end
