RSpec.describe Api::V1::Sessions::Operations::Destroy, type: :operations do
  include JWTSessions::RailsAuthorization

  let!(:user) { create(:user) }
  let(:valid_params) { { username: user.username, password: user.password } }

  let!(:request) { ActionDispatch::Request.new({ 'REQUEST_METHOD' => 'DELETE' }) }
  let!(:headers) { authenticated_header(user) }

  before do
    request.headers.merge! headers
    authorize_access_request!
  end

  describe 'sign out' do
    it { expect(described_class.call(payload: payload, params: {})).to be_success }
  end

  describe 'when get projects after sign out' do
    before do
      described_class.call(payload: payload, params: {})
    end

    it { expect(Api::V1::Projects::Operations::Show.call(params: {})).to be_failure }
  end
end
