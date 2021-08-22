class Api::V1::Lib::Operations::BaseOperation < Trailblazer::Operation
  include ::JWTSessions::RailsAuthorization
  include ::Pundit

  step :setup

  def setup(_options, params:, request:, **)
    @params = params
    @request = request
  end

  private

  attr_reader :request, :params
end
