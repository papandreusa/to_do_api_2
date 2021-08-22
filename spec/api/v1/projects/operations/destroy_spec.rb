RSpec.describe Api::V1::Projects::Operations::Destroy, type: :operations do
  let!(:user) { create(:user) }
  let!(:request) { ActionDispatch::Request.new({ 'REQUEST_METHOD' => 'DELETE' }) }
  let!(:headers) { authenticated_header(user) }
  let!(:project) { create(:project, user: user) }

  before { create_list(:project, 2) }

  describe 'success' do
    let(:valid_params) { { id: project.id } }

    before { request.headers.merge! headers }

    it { expect(described_class.call(params: valid_params, request: request)).to be_success }
    it { expect { described_class.call(params: valid_params, request: request) }.to(change(Project, :count).by(-1)) }
  end

  describe 'failure ' do
    context 'when not signed in' do
      let(:valid_params) { { id: project.id } }

      it { expect(described_class.call(params: valid_params, request: request)).to be_failure }
    end

    context 'when project not found' do
      let(:invalid_params) { { id: -1 } }

      before do
        request.headers.merge! headers
      end

      it { expect(described_class.call(params: invalid_params, request: request)).to be_failure }
    end
  end
end
