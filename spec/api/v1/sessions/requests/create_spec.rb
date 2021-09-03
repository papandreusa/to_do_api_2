RSpec.describe 'Sing In', type: :request do
  include Docs::V1::Sessions::Api
  include Docs::V1::Sessions::Create

  let!(:user) { create(:user) }
  let(:params) { { username: user.username, password: user.password } }
  let(:headers) { unauthenticated_header }

  before do
    post api_v1_auth_sign_in_path, params: params.to_json, headers: headers
  end

  describe 'Success' do
    context 'when valid params' do
      it 'sign in with valid params', :dox do
        expect(response)
          .to have_http_status(:created)
          .and match_json_schema('v1/sessions/create')
      end
    end
  end

  describe 'Failure' do
    context 'when invalid params' do
      let(:params) { { username: user.username, password: 'inValid pAssword' } }

      it 'sign in with invalid params', :dox do
        expect(response).to have_http_status(:bad_request)
      end
    end
  end
end
