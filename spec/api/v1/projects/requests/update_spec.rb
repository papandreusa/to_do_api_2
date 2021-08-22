RSpec.describe 'Patch Project', type: :request do
  include Docs::V1::Projects::Api
  include Docs::V1::Projects::Update

  let(:name) { FFaker::Lorem.word }
  let(:valid_params) { { name: name }.to_json }
  let!(:project) { create(:project, user: create(:user)) }
  let(:headers) { { 'CONTENT_TYPE' => 'application/json' } }

  describe 'Success result' do
    before do
      put api_v1_project_path(project),
          params: valid_params,
          headers: headers.merge(authenticated_header(project.user))
    end

    it 'puts valid params', :dox do
      expect(response).to have_http_status(:ok)
    end

    it { expect(response).to match_json_schema('v1/projects/project') }
    it { expect(JSON.parse(response.body)['data']['attributes']['name']).to eql name }
  end

  describe 'fail result' do
    context 'when unauthenticated' do
      before do
        patch api_v1_project_path(project), params: valid_params, headers: headers
      end

      it 'responses with status ' do
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'when put invalid params' do
      let(:invalid_params) { { name: nil }.to_json }

      before do
        patch api_v1_project_path(project),
              params: invalid_params,
              headers: headers.merge(authenticated_header(project.user))
      end

      it 'posts invalid params', :dox do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it { expect(JSON.parse(response.body)['errors']).to include({ 'detail' => 'must be filled', 'title' => 'name' }) }
    end

    context 'when update invalid project' do
      let(:invalid_id) { :invalid_id }

      before do
        patch api_v1_project_path(invalid_id),
              params: valid_params,
              headers: authenticated_header(project.user)
      end

      it 'puts project with invalid id', :dox do
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
