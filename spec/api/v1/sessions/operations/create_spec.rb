RSpec.describe Api::V1::Sessions::Operations::Create, type: :operations do
  subject(:operation) { described_class.call(params: params) }

  let!(:user) { create(:user) }
  let(:params) { { username: user.username, password: user.password } }

  describe 'Success' do
    it { is_expected.to be_success }
    it { expect(operation.to_hash.dig(:data, :access)).to be_present }
  end

  describe 'Failure' do
    let(:params) { { username: user.username, password: '1nvalid pa$$word' } }

    it { is_expected.to be_failure }
    it { expect(operation[:data]).to be_nil }
  end
end
