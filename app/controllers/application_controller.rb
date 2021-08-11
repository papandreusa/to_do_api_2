class ApplicationController < ActionController::API
  before_action :init

  attr_reader :context

  def init
    @context = {}
  end

  private

  def render_error
    render json: {
      error: context[:error],
      text: context[:text] || I18n.t(context[:error], scope: 'errors')
    }, status: context[:status]
  end
end
