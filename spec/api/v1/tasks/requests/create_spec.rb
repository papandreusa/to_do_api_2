RSpec.describe 'Create task', type: :request do
  include Docs::V1::Tasks::Api
  include Docs::V1::Tasks::Create

  let(:name) { FFaker::Lorem.word }
  let!(:user) { create(:user) }
  let(:project) { create(:project, user: user) }
  let(:params) { { name: FFaker::Lorem.word } }

  before do
    post api_v1_project_tasks_path(project), params: params.to_json, headers: headers
  end

  describe 'Success' do
    include_examples 'has created status', schema: 'v1/tasks/show'
  end

  describe 'Failture' do
    context 'when user is unauthenticated' do
      include_examples 'has unauthorized status'
    end

    context 'when params is invalid' do
      let(:params) { { name: '' } }

      include_examples 'has unprocessable entity status'
    end
  end
end
