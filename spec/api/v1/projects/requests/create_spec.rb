RSpec.describe 'Create Project', type: :request do
  include Docs::V1::Projects::Api
  include Docs::V1::Projects::Create

  let(:name) { FFaker::Lorem.word }
  let(:valid_params) { { name: name }.to_json }
  let!(:user) { create(:user) }
  let(:headers) { { 'CONTENT_TYPE' => 'application/json' } }

  describe 'Success result' do
    before do
      post api_v1_projects_path, params: valid_params, headers: headers.merge(authenticated_header(user))
    end

    it 'posts valid params', :dox do
      expect(response).to have_http_status(:created)
    end

    it { expect(response).to match_json_schema('v1/projects/project') }
    it { expect(JSON.parse(response.body)['data']['attributes']['name']).to eql name }
  end

  describe 'fail result' do
    context 'when post invalid params' do
      let(:invalid_params) { { name: nil }.to_json }

      before do
        post api_v1_projects_path, params: invalid_params, headers: headers.merge(authenticated_header(user))
      end

      it 'posts invalid params', :dox do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it { expect(response).to match_json_schema('v1/base/errors') }
    end

    context 'when unauthenticated' do
      before do
        post api_v1_projects_path, params: valid_params, headers: headers
      end

      it { expect(response).to have_http_status(:unauthorized) }
    end
  end
end
