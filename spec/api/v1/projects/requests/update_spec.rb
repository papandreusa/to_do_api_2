RSpec.describe 'Patch Project', type: :request do
  include Docs::V1::Projects::Api
  include Docs::V1::Projects::Update

  let(:user) { create(:user) }
  let!(:project) { create(:project, user: user) }
  let(:params) { { name: FFaker::Lorem.word } }

  before do
    put api_v1_project_path(project), params: params.to_json, headers: headers
  end

  describe 'Success' do
    include_examples 'has success status', schema: 'v1/projects/instance'
  end

  describe 'Failure' do
    context 'when user is unauthenticated' do
      include_examples 'has unauthorized status'
    end

    context 'when params is invalid' do
      let(:params) { { name: '' } }

      include_examples 'has unprocessable entity status'
    end

    context 'when access invalid project' do
      let(:project) { build(:project, id: 'invalid id') }

      include_examples 'has not found status'
    end

    context 'when access project of other user' do
      let!(:project) { create(:project) }

      include_examples 'has forbidden status'
    end
  end
end
