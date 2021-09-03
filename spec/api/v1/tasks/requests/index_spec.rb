RSpec.describe 'GET Tasks', type: :request do
  include Docs::V1::Tasks::Api
  include Docs::V1::Tasks::Index

  let!(:user) { create(:user) }
  let!(:project) { create(:project, :with_tasks, user: user) }

  before do
    get api_v1_project_tasks_path(project), headers: headers
  end

  describe 'Success' do
    include_examples 'has success status', schema: 'v1/tasks/collection'
  end

  describe 'Failture' do
    context 'when user is unauthenticated' do
      include_examples 'has unauthorized status'
    end

    context 'when access tasks of other user' do
      let!(:project) { create(:project, :with_tasks) }

      include_examples 'has forbidden status'
    end

    context 'when access invalid project' do
      let(:project) { build(:project, id: 'invalid id') }

      include_examples 'has not found status'
    end
  end
end
