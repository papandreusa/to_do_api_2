RSpec.describe 'Delete Task', type: :request do
  include Docs::V1::Tasks::Api
  include Docs::V1::Tasks::Destroy

  let!(:user) { create(:user) }
  let!(:project) { create(:project, user: user) }
  let!(:task) { create(:task, project: project) }

  before do
    delete api_v1_task_path(task), headers: headers
  end

  describe 'Success' do
    include_examples 'has no content status'
  end

  describe 'Failure' do
    context 'when user is unauthenticated' do
      include_examples 'has unauthorized status'
    end

    context 'when access invalid project' do
      let(:task) { build(:task, project: project, id: 'invalid id') }

      include_examples 'has not found status'
    end

    context 'when access task of other user' do
      let!(:project) { create(:project) }

      include_examples 'has forbidden status'
    end
  end
end
