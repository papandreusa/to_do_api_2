require 'swagger_helper'

RSpec.describe 'api/v1/projects', type: :request do
  path '/api/v1/projects' do
    get('list projects') do
      tags 'Projects'
      security [bearer: []]
      consumes 'application/json'
      produces 'application/json'

      response(200, 'successful') do
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

    post('create project') do
      tags 'Projects'
      security [bearer: []]
      consumes 'application/json'
      produces 'application/json'
      parameter name: :project, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string, default: 'project' },
          description: { type: :string, default: '...' }
        },
        required: ['name']
      }

      response(201, 'project created') do
        let(:Authorization) { "Bearer #{token_for(user)}" }
        let(:project) { { name: 'foo', description: 'bla bla' } }

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

  path '/api/v1/projects/{id}' do
    parameter name: 'id', in: :path, type: :integer, description: 'id'

    get('show project') do
      tags 'Projects'
      security [bearer: []]
      produces 'application/json'

      response(200, 'successful') do
        let(:Authorization) { "Bearer #{token_for(user)}" }
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end

        run_test!
      end
      response(404, 'Not Found') do
        let(:Authorization) { "Bearer #{token_for(user)}" }
        let(:id) { '123' }

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

    patch('update project') do
      tags 'Projects'
      security [bearer: []]
      consumes 'application/json'
      produces 'application/json'
      parameter name: :project, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string, default: 'foo' },
          description: { type: :string, default: nil }
        }
      }

      response(200, 'successful') do
        let(:Authorization) { "Bearer #{token_for(user)}" }
        let(:id) { '123' }
        let(:project) { { description: '...' } }

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

    put('update project') do
      tags 'Projects'
      security [bearer: []]
      consumes 'application/json'
      produces 'application/json'
      parameter name: :project, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string, default: 'foo' },
          description: { type: :string, default: nil }
        }
      }

      response(200, 'successful') do
        let(:Authorization) { "Bearer #{token_for(user)}" }
        let(:id) { '123' }
        let(:project) { { name: 'foofoo' } }

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

    delete('delete project') do
      tags 'Projects'
      security [bearer: []]

      response(204, 'successful') do
        let(:Authorization) { "Bearer #{token_for(user)}" }
        let(:id) { '123' }

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
