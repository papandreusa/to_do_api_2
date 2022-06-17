require 'swagger_helper'

RSpec.describe 'api/v1/users', type: :request do
  path '/api/v1/auth' do
    post('create user') do
      tags 'Users'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          username: { type: :string, default: 'test' },
          password: { type: :string, default: 'Abc12345' },
          password_confirmation: { type: :string, default: 'Abc12345' }
        },
        required: %w[username password password_confirmation]
      }
      response(201, 'created successful') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end

        let(:password) { '12345678' }
        let(:user) { { username: 'test', password: password, password_confirmation: password } }
        run_test!
      end
    end
  end
end
