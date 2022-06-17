require 'swagger_helper'

RSpec.describe 'api/v1/auth/sessions', type: :request do
  path '/api/v1/auth/sign_in' do
    post('create session') do
      tags 'Sessions'
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
        let(:username) { 'test' }
        let(:password) { 'udfshjh878' }
        let(:user) { { username: 'test', password: password } }

        before do
          create(:user, username: username, password: password)
        end

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

        let(:user) { create(:user) }
        run_test!
      end
    end
  end
end
