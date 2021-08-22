RSpec.describe Api::V1::Projects::Operations::Index, type: :operations do
  let!(:user) { create(:user) }
  let!(:request) { ActionDispatch::Request.new({ 'REQUEST_METHOD' => 'GET' }) }
  let!(:headers) { authenticated_header(user) }
  let(:params) { ActionController::Parameters.new({}) }

  before { create_list(:project, 2, user: user) }

  describe 'success' do
    before { request.headers.merge! headers }

    it { expect(described_class.call(params: params, request: request)).to be_success }
  end

  describe 'failure ' do
    context 'when not signed in' do
      it { expect(described_class.call(params: params, request: request)).to be_failure }
    end
  end
end
