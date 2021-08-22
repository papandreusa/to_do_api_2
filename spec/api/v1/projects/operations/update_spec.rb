RSpec.describe Api::V1::Projects::Operations::Update, type: :operations do
  let!(:user) { create(:user) }
  let!(:request) { ActionDispatch::Request.new({ 'REQUEST_METHOD' => 'PATCH' }) }
  let!(:headers) { authenticated_header(user) }
  let!(:project) { create(:project, user: user) }

  describe 'success' do
    let(:valid_params) { { id: project.id, name: FFaker::Lorem.word } }

    before { request.headers.merge! headers }

    it { expect(described_class.call(params: valid_params, request: request)).to be_success }
    it { expect { described_class.call(params: valid_params, request: request) }.to(change { project.reload.name }) }
  end

  describe 'failure ' do
    context 'when not signed in' do
      let(:valid_params) { { id: project.id, name: FFaker::Lorem.word } }

      it { expect(described_class.call(params: valid_params, request: request)).to be_failure }
    end

    context 'when validation fails' do
      let(:invalid_params) { { name: nil } }

      before do
        request.headers.merge! headers
      end

      it { expect(described_class.call(params: invalid_params, request: request)).to be_failure }
    end
  end
end
