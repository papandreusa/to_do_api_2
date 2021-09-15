module AuthenticationHelper
  def authenticated_header(user, json: true)
    tokens = JWTSessions::Session.new(payload: { user_id: user.id }, refresh_by_access_allowed: true).login
    { Authorization: tokens[:access], 'X-Refresh-Token': tokens[:refresh] }.merge unauthenticated_header(json: json)
  end

  def unauthenticated_header(json: true)
    json ? { 'CONTENT_TYPE' => 'application/json' } : {}
  end
end

RSpec.configure do |config|
  config.include AuthenticationHelper
end
