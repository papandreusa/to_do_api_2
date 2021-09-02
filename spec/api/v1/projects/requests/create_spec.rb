RSpec.describe 'Create Project', type: :request do
  include Docs::V1::Projects::Api
  include Docs::V1::Projects::Create

  let(:user) { create(:user) }
  let(:params) { { name: FFaker::Lorem.word } }

  before do
    post api_v1_projects_path, params: params.to_json, headers: headers
  end

  describe 'Success' do
    include_examples 'has created status', schema: 'v1/projects/instance'
  end

  describe 'Failure' do
    context 'when user is unauthenticated' do
      include_examples 'has unauthorized status'
    end

    context 'when params is invalid' do
      let(:params) { { name: '' } }

      include_examples 'has unprocessable entity status'
    end
  end
end
