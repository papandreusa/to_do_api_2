require 'swagger_helper'

RSpec.describe 'api/v1/comments', type: :request do
  path '/api/v1/tasks/{task_id}/comments' do
    parameter name: 'task_id', in: :path, type: :integer, description: 'task_id'

    get('list comments') do
      tags 'Comments'
      security [bearer: []]
      consumes 'application/json'
      produces 'application/json'

      response(200, 'successful') do
        let(:user) { create(:user) }
        let(:Authorization) { "Bearer #{token_for(user)}" }
        let(:project) { create(:project, user: user) }
        let(:task) { create(:task, project: project) }
        let(:task_id) { task.id }

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

    post('create comment') do
      tags 'Comments'
      security [bearer: []]
      consumes 'application/json'
      produces 'application/json'
      parameter name: :comment, in: :body, schema: {
        type: :object,
        properties: {
          body: { type: :string, default: 'bla bla', nullable: false }
        },
        required: %w[body]
      }

      response(201, 'created successful') do
        let(:user) { create(:user) }
        let(:Authorization) { "Bearer #{token_for(user)}" }
        let(:project) { create(:project, user: user) }
        let(:task) { create(:task, project: project) }
        let(:task_id) { task.id }
        let(:comment) { { body: 'bla bla bla bla' } }

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

  path '/api/v1/comments/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :integer, description: 'id'

    delete('delete comment') do
      tags 'Comments'
      security [bearer: []]
      consumes 'application/json'
      produces 'application/json'

      response(204, 'deleted successful') do
        let(:user) { create(:user) }
        let(:Authorization) { "Bearer #{token_for(user)}" }
        let(:project) { create(:project, user: user) }
        let(:task) { create(:task, project: project) }
        let(:comment) { create(:comment, task: task) }
        let(:id) { comment.id }

        run_test!
      end
    end
  end
end
