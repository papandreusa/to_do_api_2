require 'swagger_helper'

RSpec.describe 'api/v1/tasks', type: :request do
  path '/api/v1/projects/{project_id}/tasks' do
    # You'll want to customize the parameter types...
    parameter name: 'project_id', in: :path, type: :integer, description: 'project_id'

    get('list tasks') do
      tags 'Tasks'
      security [bearer: []]
      consumes 'application/json'
      produces 'application/json'

      response(200, 'successful') do
        let(:Authorization) { "Bearer #{token_for(user)}" }
        let(:project_id) { '123' }

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

    post('create task') do
      tags 'Tasks'
      security [bearer: []]
      consumes 'application/json'
      produces 'application/json'

      parameter name: :task, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string, default: 'task' },
          due_date: { type: :string, default: nil },
          position: { type: :integer, default: 0 },
          done: { type: :boolean, default: false }
        },
        required: %w[name position done]
      }

      response(201, 'created successful') do
        let(:Authorization) { "Bearer #{token_for(user)}" }
        let(:project_id) { '123' }

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

  path '/api/v1/tasks/{id}' do
    parameter name: 'id', in: :path, type: :integer, description: 'id'

    get('show task') do
      tags 'Tasks'
      security [bearer: []]
      consumes 'application/json'
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
    end

    patch('update task') do
      tags 'Tasks'
      security [bearer: []]
      consumes 'application/json'
      produces 'application/json'

      parameter name: :task, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string, default: 'task' },
          due_date: { type: :string, default: nil },
          position: { type: :integer, default: 0 },
          done: { type: :boolean, default: false }
        }
      }

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
    end

    put('update task') do
      tags 'Tasks'
      security [bearer: []]
      consumes 'application/json'
      produces 'application/json'

      response(200, 'successful') do
        let(:Authorization) { "Bearer #{token_for(user)}" }
        let(:id) { '123' }

        parameter name: :task, in: :body, schema: {
          type: :object,
          properties: {
            name: { type: :string, default: 'task' },
            due_date: { type: :string, default: nil },
            position: { type: :integer, default: 0 },
            done: { type: :boolean, default: false }
          },
          required: %w[name position done]
        }

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

    delete('delete task') do
      tags 'Tasks'
      security [bearer: []]
      consumes 'application/json'
      produces 'application/json'

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
