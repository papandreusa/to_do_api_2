RSpec.describe 'Api::V1::Projects::Operations::Show', type: :request do
  include Docs::V1::Projects::Api
  include Docs::V1::Projects::Show

  let!(:user) { create(:user) }
  let!(:project) { create(:project, user: user) }

  describe 'Success result' do
    before do
      get api_v1_project_path(project), headers: authenticated_header(user)
    end

    it 'gets project', :dox do
      expect(response).to have_http_status(:ok)
    end

    it { expect(response).to match_json_schema('v1/projects/project') }
    it { expect(JSON.parse(response.body)['data']['attributes']['name']).to eql project.name }
  end

  describe 'fail result' do
    context 'when get invalid id' do
      let(:invalid_id) { { id: :invalid_id } }

      before do
        get api_v1_project_path(invalid_id), headers: authenticated_header(user)
      end

      it 'gets project with invalid id', :dox do
        expect(response).to have_http_status(:not_found)
      end
    end

    context 'when unauthenticated' do
      before do
        get api_v1_project_path(project)
      end

      it { expect(response).to have_http_status(:unauthorized) }
    end
  end
end
