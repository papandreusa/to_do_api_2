RSpec.describe Api::V1::Sessions::Operations::Create, type: :operations do
  let!(:user) { create(:user) }
  let(:valid_params) { { username: user.username, password: user.password } }

  describe 'success' do
    it { expect(described_class.call(params: valid_params)).to be_success }
    it { expect(described_class.call(params: valid_params).to_hash.dig(:data, :access)).not_to be_nil }
  end

  describe 'fail' do
    let(:invalid_params) { { username: user.username, password: '1nvalid pa$$word' } }

    it { expect(described_class.call(params: invalid_params)).to be_failure }
    it { expect(described_class.call(params: invalid_params)[:data]).to be_nil }
  end
end
