class Api::V1::BaseController < ApplicationController
  include JWTSessions::RailsAuthorization
  include Api::V1::Endpoint
end
