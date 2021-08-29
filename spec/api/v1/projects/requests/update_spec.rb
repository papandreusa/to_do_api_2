RSpec.describe 'Patch Project', type: :request do
  include Docs::V1::Projects::Api
  include Docs::V1::Projects::Update

  let(:name) { FFaker::Lorem.word }
  let(:params) { { name: name } }
  let!(:project) { create(:project, user: create(:user)) }

  describe 'Success result' do
    before do
      put api_v1_project_path(project),
          params: params.to_json,
          headers: authenticated_header(project.user)
    end

    it 'puts valid params', :dox do
      expect(response)
        .to have_http_status(:ok)
        .and match_json_schema('v1/projects/instance')
    end
  end

  describe 'fail result' do
    context 'when unauthenticated' do
      before do
        patch api_v1_project_path(project), params: params.to_json, headers: headers
      end

      it 'responses with status ' do
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'when put invalid params' do
      let(:params) { { name: nil } }

      before do
        patch api_v1_project_path(project),
              params: params.to_json,
              headers: authenticated_header(project.user)
      end

      it 'posts invalid params', :dox do
        expect(response)
          .to have_http_status(:unprocessable_entity)
          .and match_json_schema('v1/base/errors')
      end
    end

    context 'when update invalid project' do
      let(:invalid_id) { :invalid_id }

      before do
        patch api_v1_project_path(invalid_id),
              params: params.to_json,
              headers: authenticated_header(project.user)
      end

      it 'puts project with invalid id', :dox do
        expect(response).to have_http_status(:not_found)
      end
    end

    context 'when accesses project of other user' do
      let(:project2) { create(:project) }

      before do
        patch api_v1_project_path(project2),
              params: params.to_json,
              headers: authenticated_header(project.user)
      end

      it 'gets project of ohter user', :dox do
        expect(response).to have_http_status(:forbidden)
      end
    end
  end
end
