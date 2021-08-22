RSpec.describe Api::V1::Sessions::Operations::Destroy, type: :operations do
  let!(:user) { create(:user) }
  let(:valid_params) { { username: user.username, password: user.password } }

  let!(:request) { ActionDispatch::Request.new({ 'REQUEST_METHOD' => 'DELETE' }) }
  let!(:headers) { authenticated_header(user) }

  before { request.headers.merge! headers }

  describe 'success' do
    it { expect(described_class.call(request: request, params: {})).to be_success }
  end

  describe 'when fail after sign out' do
    before do
      described_class.call(request: request, params: {})
    end

    it { expect(Api::V1::Lib::Operations::Authenticate.call(request: request, params: {})).to be_failure }
  end
end
