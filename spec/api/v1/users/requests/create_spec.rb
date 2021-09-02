RSpec.describe 'Registration', type: :request do
  include Docs::V1::Users::Api
  include Docs::V1::Users::Create

  let(:user) { build(:user) }
  let!(:params) { { username: user.username, password: user.password, password_confirmation: user.password } }

  before do
    post api_v1_auth_path, params: params
  end

  describe 'Success' do
    include_examples 'has created status', schema: 'v1/sessions/create'
  end

  describe 'Failure' do
    context 'when params is invalid' do
      let(:params) { { username: 'user', password: 'Inv@lid P@$$w0rd', password_confirmation: 'inValid pAssword' } }

      include_examples 'has unprocessable entity status'
    end
  end
end
