RSpec.describe Api::V1::Projects::Operations::Create, type: :operations do
  let!(:user) { create(:user) }
  let!(:request) { ActionDispatch::Request.new({ 'REQUEST_METHOD' => 'POST' }) }
  let!(:headers) { authenticated_header(user) }

  describe 'success' do
    let(:valid_params) { { name: FFaker::Lorem.word } }

    before { request.headers.merge! headers }

    it { expect(described_class.call(params: valid_params, request: request)).to be_success }
    it { expect { described_class.call(params: valid_params, request: request) }.to change(Project, :count).by(1) }
  end

  describe 'failure ' do
    let(:valid_params) { { name: FFaker::Lorem.word } }

    context 'when not signed in' do
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
