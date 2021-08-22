RSpec.describe 'GET Projects', type: :request do
  include Docs::V1::Projects::Api
  include Docs::V1::Projects::Index

  let!(:user) { create(:user) }
  let!(:projects) { create_list(:project, 2, user: user) }

  describe 'Success result' do
    before do
      get api_v1_projects_path, headers: authenticated_header(user)
    end

    it 'gets index of projects', :dox do
      expect(response).to have_http_status(:ok)
    end

    it { expect(response).to match_json_schema('v1/projects/projects') }
    it { expect(JSON.parse(response.body)['data'].count).to eql projects.count }
  end

  describe 'fail result' do
    context 'when unauthenticated' do
      before do
        get api_v1_projects_path
      end

      it { expect(response).to have_http_status(:unauthorized) }
    end
  end
end
