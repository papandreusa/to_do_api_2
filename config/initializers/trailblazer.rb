require 'reform/form/dry'
require 'reform/form'
require 'reform'

Reform::Form.class_eval do
  include Reform::Form::Dry
end
Rails.application.config.reform.validations = :dry
Rails.application.config.trailblazer.application_controller = 'ApiController'
