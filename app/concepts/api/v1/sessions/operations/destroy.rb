class Api::V1::Sessions::Operations::Destroy < Api::V1::Lib::Operations::BaseOperation
  step :flush_session!
  pass :set_message

  def flush_session!(options, **)
    session = JWTSessions::Session.new(payload: payload)
    session.flush_by_access_payload
  end

  def set_message(options, **)
    options[:data] = :signed_out
  end
end
