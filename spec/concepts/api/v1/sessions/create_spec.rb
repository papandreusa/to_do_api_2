RSpec.describe 'Api::V1::Sessions::Opeartion::Create', type: :request do
  let!(:user) { create(:user) }
  let(:username) { user.username }
  let(:password) { user.password }
  let(:valid_params) { { username: username, password: password } }

  describe 'POST #create' do
    context 'when valid params' do
      before do
        post api_v1_sessions_path, params: valid_params
      end

      it { expect(response).to have_http_status(:created) }
      it { expect(response).to match_json_schema('v1/sessions/create') }
    end

    context 'when invalid params' do
      let(:valid_params) do
        { username: username, password: 'inValid pAssword' }
      end

      before do
        post api_v1_sessions_path, params: valid_params
      end

      it { expect(response).to have_http_status(:bad_request) }
    end
  end
end
