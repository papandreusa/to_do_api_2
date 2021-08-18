RSpec.describe 'Api::V1::Users::Opeartion::Create', type: :request do
  describe 'POST #create' do
    context 'when valid params' do
      let(:password) { FFaker::Internet.password(10) }
      let(:valid_params) do
        {
          username: FFaker::Lorem.word,
          password: password,
          password_confirmation: password
        }
      end

      before do
        post '/api/v1/users', params: valid_params
      end

      it { expect(response).to have_http_status(:ok) }
      it { expect(response.content_type).to include('application/json') }
      it { expect(response).to match_json_schema('api/v1/users/create') }
    end

    context 'when invalid params' do
      let(:password) { FFaker::Internet.password(10) }
      let(:valid_params) do
        {
          username: FFaker::Lorem.word,
          password: password,
          password_confirmation: 'inValid pAssword'
        }
      end

      before do
        post '/api/v1/users', params: valid_params
      end

      it { expect(response).to have_http_status(:unprocessable_entity) }
      it { expect(response.content_type).to include('application/json') }
      it { expect(response).to match_json_schema('api/v1/base/errors') }
    end
  end
end
