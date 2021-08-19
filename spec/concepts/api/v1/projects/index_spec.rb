RSpec.describe 'Api::V1::Projects::Operations::Index', type: :request do
  include Docs::V1::Projects::Api

  # include ApiDoc::V1::User::Registration::Create
  let!(:user) { create(:user) }
  let!(:projects) { create_list(:project, 2, user: user) }

  describe 'Success result' do
    include Docs::V1::Projects::Index
    before do
      get api_v1_projects_path, headers: authenticated_header(user)
    end

    it 'renders index of projects', :dox do
      expect(response).to have_http_status(:ok)
    end

    it 'renders with json schema', :dox do
      expect(response).to match_json_schema('v1/projects/projects')
    end

    it { expect(JSON.parse(response.body)['data'].count).to eql projects.count }
  end

  describe 'fail result' do

    context 'when unauthenticated' do
      before do
        get api_v1_projects_path
      end

      it 'responses with status ' do
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
