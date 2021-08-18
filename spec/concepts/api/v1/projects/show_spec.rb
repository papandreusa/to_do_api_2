RSpec.describe 'Api::V1::Projects::Operations::Show', type: :request do
  # include ApiDoc::V1::User::Registration::Api

  # include ApiDoc::V1::User::Registration::Create
  let!(:user) { create(:user) }
  let!(:project) { create(:project, user: user) }

  describe 'Success result' do
    before do
      get api_v1_project_path(project), headers: authenticated_header(user)
    end

    it 'renders index of projects', :dox do
      expect(response).to have_http_status(:ok)
    end

    it 'renders with json schema' do
      expect(response).to match_json_schema('api/v1/projects/project')
    end

    it { expect(JSON.parse(response.body)['data']['attributes']['name']).to eql project.name }
  end

  describe 'fail result' do
    context 'when unauthenticated' do
      before do
        get api_v1_project_path(project)
      end

      it 'responses with status ' do
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'when get invalid id' do
      let(:invalid_id) { { id: :invalid_id } }

      before do
        get api_v1_project_path(invalid_id), headers: authenticated_header(user)
      end

      it 'renders with json schema ' do
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
