class Api::V1::StandardController < ApplicationController
  include JWTSessions::RailsAuthorization

  rescue_from JWTSessions::Errors::Unauthorized, with: :not_authorized

  before_action :authenticate_user!

  def index(&block)
    block ? action(:ok, &block) : action(:no_content)
  end

  def show(&block)
    block ? action(:ok, &block) : action(:no_content)
  end

  def create(&block)
    block ? action(:created, &block) : action(:no_content)
  end

  def update(&block)
    block ? action(:ok, &block) : action(:no_content)
  end

  def destroy(&block)
    block ? action(:ok, &block) : action(:no_content)
  end

  private

  def action(status)
    yield if block_given?
    return render_error if context[:error]

    render json: { data: context[:data] }, status: status
  end

  def authenticate_user!
    authorize_access_request!
    context[:current_user] = User.find(payload['user_id'])
  end

  def not_authorized
    context[:error] = :unauthorized
    context[:status] = :unauthorized
    render_error
  end
end
