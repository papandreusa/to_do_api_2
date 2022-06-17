require 'swagger_helper'

RSpec.describe 'api/v1/auth/sessions', type: :request do
  path '/api/v1/auth/sign_in' do
    post('create session') do
      tags 'Sessions'
      security [bearer: []]
      consumes 'application/json'
      produces 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          username: { type: :string, default: 'test' },
          password: { type: :string, default: 'Q12345678' }
        }
      }

      response(201, 'sign in successful') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end

        run_test!
      end
    end
  end

  path '/api/v1/auth/sign_out' do
    delete('delete session') do
      tags 'Sessions'
      security [bearer: []]
      consumes 'application/json'
      produces 'application/json'

      response(204, 'sign out successful') do
        let(:Authorization) { "Bearer #{token_for(user)}" }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end

        run_test!
      end
    end
  end
end
