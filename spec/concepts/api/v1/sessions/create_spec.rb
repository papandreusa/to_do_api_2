RSpec.describe 'Api::V1::Sessions::Opeartion::Create', type: :request do

  let!(:user) { create(:user)}
  let(:username) {user.username}
  let(:password) { user.password}
  let(:valid_params) { {username: username, password: password } }
  describe 'POST #create' do
    context 'when valid params' do

      before do
        post api_v1_sessions_path, params: valid_params
      end

      it { expect(response).to have_http_status(:created) }
      it { expect(response.content_type).to include('application/json') }
      it { expect(response).to match_json_schema('api/v1/sessions/create') }
    end

    context 'when invalid params' do
      let(:valid_params) do
        { username: username, password: 'inValid pAssword' }.to_json
      end

      before do
        post api_v1_sessions_path, params: valid_params
      end

      it { expect(response).to have_http_status(:not_found) }
      it { expect(response.content_type).to include('application/json') }
    end
  end
end
