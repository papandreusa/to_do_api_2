RSpec.describe 'Update Task Done', type: :request do
  include Docs::V1::Tasks::Api
  include Docs::V1::Tasks::UpdateDone

  let!(:user) { create(:user) }
  let!(:project) { create(:project, user: user) }
  let!(:task) { create(:task, project: project, done: false) }

  before do
    patch api_v1_task_complete_path(task), headers: headers
  end

  describe 'Success' do
    include_examples 'has success status', schema: 'v1/tasks/show'
  end

  describe 'Failure' do
    context 'when user is unauthenticated' do
      include_examples 'has unauthorized status'
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
