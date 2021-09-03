RSpec.describe Api::V1::Sessions::Operations::Destroy, type: :operations do
  include JWTSessions::RailsAuthorization
  subject(:operation) { described_class.call(payload: payload, params: params) }

  let!(:user) { create(:user) }
  let(:params) { {} }

  let!(:request) { ActionDispatch::Request.new({ 'REQUEST_METHOD' => 'DELETE' }) }

  before do
    request.headers.merge! authenticated_header(user)
    authorize_access_request!
  end

  describe 'sign out' do
    it { is_expected.to be_success }

    it 'raises error' do
      expect do
        operation
        authorize_access_request!
      end.to raise_error JWTSessions::Errors::Unauthorized
    end
  end
end
