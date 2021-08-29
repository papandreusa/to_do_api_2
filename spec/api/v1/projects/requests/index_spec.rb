RSpec.describe 'GET Projects', type: :request do
  include Docs::V1::Projects::Api
  include Docs::V1::Projects::Index

  let!(:user) { create(:user) }

  before do
    create_list(:project, 2, user: user)
  end

  describe 'Success result' do
    before do
      get api_v1_projects_path, headers: authenticated_header(user)
    end

    it 'gets index of projects', :dox do
      expect(response)
        .to have_http_status(:ok)
        .and match_json_schema('v1/projects/collection')
    end
  end

  describe 'fail result' do
    context 'when unauthenticated' do
      before do
        get api_v1_projects_path
      end

      it 'when unauthenticated', :dox do
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
