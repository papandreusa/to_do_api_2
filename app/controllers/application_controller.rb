class ApplicationController < ActionController::API
  before_action :setup

  attr_reader :context

  def setup
    @context = {}
  end
end
