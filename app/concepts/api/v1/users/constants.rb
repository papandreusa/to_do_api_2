module Api::V1::Users::Constants
  USERNAME_MIN = 3
  USERNAME_MAX = 50
  PASSWORD_MIN = 8
  PASSWORD_REGEX = /\A[A-Za-z0-9]{8,}\z/i
end
