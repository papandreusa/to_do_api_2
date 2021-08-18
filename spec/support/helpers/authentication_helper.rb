module AuthenticationHelper
  def authenticated_header(user)
    token = JWTSessions::Session.new(payload: { user_id: user.id }).login[:access]
    { Authorization: token }
  end
end

RSpec.configure do |c|
  c.include AuthenticationHelper
end
