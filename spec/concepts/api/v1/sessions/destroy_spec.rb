RSpec.describe 'Api::V1::Sessions::Opeartion::Create', type: :request do

  let!(:user) { create(:user)}
  let(:username) {user.username}
  let(:password) { user.password}
  let!(:headers) { authenticated_header(user) }
  describe 'DELETE #destroy' do
    context 'when valid params' do

      before do
        delete api_v1_sessions_path, headers: headers
      end

      it { expect(response).to have_http_status(:no_content) }

      context 'when get data' do
        before do
          get api_v1_projects_path, headers: headers
        end

        it 'responses with status ' do
          expect(response).to have_http_status(:unauthorized)
        end
      end
    end

  end
end
