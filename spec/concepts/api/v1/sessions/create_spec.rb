RSpec.describe 'Api::V1::Sessions::Opeartion::Create', type: :request do
  include Docs::V1::Sessions::Api
  include Docs::V1::Sessions::Create

  let!(:user) { create(:user) }
  let(:valid_params) { { username: user.username, password: user.password }.to_json }
  let(:headers) { { 'CONTENT_TYPE' => 'application/json' } }

  describe 'POST #create' do
    context 'when valid params' do
      before do
        post api_v1_auth_sign_in_path, params: valid_params, headers: headers
      end

      it 'sign in with valid params', :dox do
        expect(response).to have_http_status(:created)
      end

      it { expect(response).to match_json_schema('v1/sessions/create') }
    end

    context 'when invalid params' do
      let(:valid_params) { { username: user.username, password: 'inValid pAssword' }.to_json }

      before do
        post api_v1_auth_sign_in_path, params: valid_params, headers: headers
      end

      it 'sign in with invalid params', :dox do
        expect(response).to have_http_status(:bad_request)
      end
    end
  end
end
