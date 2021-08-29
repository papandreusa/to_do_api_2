RSpec.describe 'Create Project', type: :request do
  include Docs::V1::Projects::Api
  include Docs::V1::Projects::Create

  let(:name) { FFaker::Lorem.word }
  let(:params) { { name: name } }
  let!(:user) { create(:user) }

  describe 'Success result' do
    before do
      post api_v1_projects_path, params: params.to_json, headers: authenticated_header(user)
    end

    it 'posts valid params', :dox do
      expect(response)
        .to have_http_status(:created)
        .and match_json_schema('v1/projects/instance')
    end
  end

  describe 'fail result' do
    context 'when post invalid params' do
      let(:params) { { name: nil } }

      before do
        post api_v1_projects_path, params: params.to_json, headers: authenticated_header(user)
      end

      it 'posts invalid params', :dox do
        expect(response)
          .to have_http_status(:unprocessable_entity)
          .and match_json_schema('v1/base/errors')
      end
    end

    context 'when unauthenticated' do
      before do
        post api_v1_projects_path, params: params.to_json, headers: headers
      end

      it 'when unauthenticated', :dox do
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
