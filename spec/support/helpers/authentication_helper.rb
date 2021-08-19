module AuthenticationHelper
  def authenticated_header(user)
    token = JWTSessions::Session.new(payload: { user_id: user.id }, refresh_by_access_allowed: true).login[:access]
    { Authorization: token }
  end
end

RSpec.configure do |c|
  c.include AuthenticationHelper
end
