RSpec.describe Api::V1::Projects::Operations::Show, type: :operations do
  let!(:user) { create(:user) }
  let!(:request) { ActionDispatch::Request.new({ 'REQUEST_METHOD' => 'GET' }) }
  let!(:headers) { authenticated_header(user) }
  let!(:project) { create(:project, user: user) }
  let(:valid_params) { { id: project.id } }

  describe 'success' do
    before { request.headers.merge! headers }

    it { expect(described_class.call(params: valid_params, request: request)).to be_success }
  end

  describe 'failure ' do
    context 'when not signed in' do
      it { expect(described_class.call(params: valid_params, request: request)).to be_failure }
    end

    context 'when project created by other user' do
      let!(:project) { create(:project) }
      let(:valid_params) { { id: project.id } }

      before { request.headers.merge! headers }

      it { expect(described_class.call(params: valid_params, request: request)).to be_failure }
    end
  end
end
