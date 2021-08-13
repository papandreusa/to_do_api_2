class Api::V1::Sessions::Operation::Destroy < Api::V1::Lib::Operation::BaseOperation
  step :flush_session!
  pass :set_message

  def flush_session!(options, **)
    session = JWTSessions::Session.new(payload: payload)
    session.flush_by_access_payload
  rescue JWTSessions::Errors::Unauthorized
    options[:status] = :unauthorized
    false
  end

  def set_message(options, **)
    options[:data] = :signed_out
  end
end
