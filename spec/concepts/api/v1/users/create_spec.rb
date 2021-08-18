RSpec.describe 'Api::V1::Users::Opeartion::Create', type: :request do
  describe 'POST #create' do
    context 'when valid params' do
      let(:user) { build(:user) }
      let(:username) { user.username }
      let(:password) { user.password }
      let!(:valid_params) { { username: username, password: password, password_confirmation: password  } }

      before do
        post api_v1_users_path, params: valid_params
      end

      it { expect(response).to have_http_status(:created) }
      it { expect(response.content_type).to include('application/json') }
      it { expect(response).to match_json_schema('api/v1/sessions/create') }
    end

    context 'when invalid params' do
      let(:password) { FFaker::Internet.password(10) }
      let(:invalid_params) do
        {
          username: FFaker::Lorem.word,
          password: password,
          password_confirmation: 'inValid pAssword'
      }.to_json
      end

      before do
        post api_v1_users_path, params: invalid_params
      end

      it { expect(response).to have_http_status(:unprocessable_entity) }
      it { expect(response.content_type).to include('application/json') }
      it { expect(response).to match_json_schema('api/v1/base/errors') }
    end
  end
end
