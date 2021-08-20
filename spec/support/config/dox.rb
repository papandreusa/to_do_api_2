require 'dox'
Dox.configure do |config|
  config.headers_whitelist = ['Content-Type']
end

RSpec.configure do |config|
  config.after(:each, :dox) do |example|
    example.metadata[:request] = request
    example.metadata[:response] = response
  end
end

module Docs
end

module Docs::V1
end

Dir[Rails.root.join('spec/docs/**/*.rb')].each { |file| require file }
