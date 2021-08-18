RSpec.describe 'Api::V1::Projects::Operations::Update', type: :request do
  # include ApiDoc::V1::User::Registration::Api

  # include ApiDoc::V1::User::Registration::Create
  let(:name) { FFaker::Lorem.word }
  let(:valid_params) { { name: name } }
  let!(:user) { create(:user) }
  let!(:project) { create(:project, user: user) }
  describe 'Success result' do
    before do
      put api_v1_project_path(project), params: valid_params, headers:authenticated_header(user)
    end

    it 'responses status ok', :dox do
      expect(response).to have_http_status(:ok)
    end

    it 'renders with json schema' do
      expect(response).to match_json_schema('api/v1/projects/project')
    end

    it { expect(JSON.parse(response.body)['data']['attributes']['name']).to eql name }
  end

  describe 'fail result' do
    context 'when unauthenticated' do
      before do
        put api_v1_project_path(project), params: valid_params
      end

      it 'responses with status ' do
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'when put invalid params' do
      let(:invalid_params) { { name: nil } }

      before do
        put api_v1_project_path(project), params: invalid_params, headers: authenticated_header(user)
      end

      it 'responds with errors ' do
        expect(JSON.parse(response.body)['errors']).to include({ 'detail' => 'must be filled', 'title' => 'name' })
      end
    end

    context 'when update invalid project' do
      let(:invalid_id) { :invalid_id }

      before do
        put api_v1_project_path(invalid_id), params: valid_params, headers: authenticated_header(user)
      end

      it 'renders with json schema ' do
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
