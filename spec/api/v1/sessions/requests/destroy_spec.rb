RSpec.describe 'Sign Out', type: :request do
  include Docs::V1::Sessions::Api
  include Docs::V1::Sessions::Destroy

  let!(:user) { create(:user) }
  let!(:headers) { authenticated_header(user) }

  before do
    delete api_v1_auth_sign_out_path, headers: headers
  end

  describe 'Success' do
    it 'sign out', :dox do
      expect(response).to have_http_status(:no_content)
    end
  end

  describe 'Failure' do
    it 'responses with status :unauthorized when get data after logout' do
      get api_v1_projects_path, headers: headers
      expect(response).to have_http_status(:unauthorized)
    end
  end
end
