module AuthenticationHelper
  def authenticated_header(user)
    tokens = JWTSessions::Session.new(payload: { user_id: user.id }, refresh_by_access_allowed: true).login
    { 'CONTENT_TYPE' => 'application/json', Authorization: tokens[:access], 'X-Refresh-Token': tokens[:refresh] }
  end

  def unauthenticated_header
    { 'CONTENT_TYPE' => 'application/json' }
  end
end

RSpec.configure do |config|
  config.include AuthenticationHelper
end
