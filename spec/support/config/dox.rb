require 'dox'
Dir[Rails.root.join('spec/docs/**/*.rb')].each { |file| require file }
Dox.configure do |config|
  config.descriptions_location  = Rails.root.join('spec/docs/v1/descriptions')
  # config.schema_request_folder_path = Rails.root.join('spec/docs/v1/schemas')
  # config.schema_response_folder_path = Rails.root.join('spec/support/v1/schemas')
  # config.schema_response_fail_file_path = Rails.root.join('spec/support/v1/schemas/error.json')
  config.headers_whitelist = ['Accept']
  # config.title = 'API'
  # config.api_version = '2.0'
  # config.header_description = 'api_description.md'
end

RSpec.configure do |config|
  config.after(:each, :dox) do |example|
    example.metadata[:request] = request
    example.metadata[:response] = response
  end
end
