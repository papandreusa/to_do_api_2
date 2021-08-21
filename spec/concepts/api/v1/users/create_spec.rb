RSpec.describe 'Api::V1::Users::Opeartion::Create', type: :request do
  include Docs::V1::Users::Api
  include Docs::V1::Users::Create

  context 'when valid params' do
    let(:user) { build(:user) }
    let!(:valid_params) { { username: user.username, password: user.password, password_confirmation: user.password } }
    let(:headers) { { 'CONTENT_TYPE' => 'application/json' } }

    before do
      post api_v1_auth_path, params: valid_params
    end

    it 'registers user with valid params', :dox do
      expect(response).to have_http_status(:created)
    end

    it { expect(response).to match_json_schema('v1/sessions/create') }
  end

  context 'when invalid params' do
    let(:password) { FFaker::Internet.password(10) }
    let(:invalid_params) do
      {
        username: FFaker::Lorem.word,
        password: 'Inv@lid P@$$w0rd',
        password_confirmation: 'inValid pAssword'
      }
    end

    before do
      post api_v1_auth_path, params: invalid_params
    end

    it 'register user with invalid params', :dox do
      expect(response).to have_http_status(:unprocessable_entity)
    end

    it { expect(response).to match_json_schema('v1/base/errors') }
  end
end
