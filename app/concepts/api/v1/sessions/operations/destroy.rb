class Api::V1::Sessions::Operations::Destroy < Trailblazer::Operation
  step :flush_session!

  private

  def flush_session!(_ctx, payload:, **)
    session = JWTSessions::Session.new(payload: payload, refresh_by_access_allowed: true)
    session.flush_by_access_payload
  end
end
