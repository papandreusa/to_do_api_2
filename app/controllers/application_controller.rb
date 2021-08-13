class ApplicationController < ActionController::API
  before_action :setup

  attr_reader :context

  def setup
    @context = {}
  end

  def render_error
    render json: {
      error: context[:error],
      text: context[:text] || I18n.t(context[:error], scope: 'errors')
    }, status: context[:status]
  end
end
