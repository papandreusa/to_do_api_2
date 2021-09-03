RSpec.describe 'Update Task Position', type: :request do
  include Docs::V1::Tasks::Api
  include Docs::V1::Tasks::UpdatePosition

  let!(:user) { create(:user) }
  let!(:project) { create(:project, :with_tasks, user: user) }
  let!(:task) { create(:task, project: project, position: 1) }
  let(:params) { { position: project.tasks_count } }

  before do
    patch api_v1_task_position_path(task), params: params.to_json, headers: headers
  end

  describe 'Success' do
    include_examples 'has success status', schema: 'v1/tasks/instance'
  end

  describe 'Failure' do
    context 'when user is unauthenticated' do
      include_examples 'has unauthorized status'
    end

    context 'when params is invalid' do
      let(:params) { { position: project.tasks_count.next } }

      include_examples 'has unprocessable entity status'
    end

    context 'when access invalid project' do
      let(:task) { build(:task, project: project, id: 'invalid id') }

      include_examples 'has not found status'
    end

    context 'when access project of other user' do
      let!(:project) { create(:project) }

      include_examples 'has forbidden status'
    end
  end
end
