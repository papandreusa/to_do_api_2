RSpec.describe Api::V1::Users::Operations::Create, type: :operations do
  let(:user) { build(:user) }
  let(:valid_params) { { username: user.username, password: user.password, password_confirmation: user.password } }

  describe 'success' do
    it { expect(described_class.call(params: valid_params)).to be_success }

    it 'creates user' do
      expect { described_class.call(params: valid_params) }.to change(User, :count).by(1)
    end
  end

  describe 'fail' do
    let(:invalid_params) { { username: 'us', password: 'short', password_confirmation: 'foo' } }

    it { expect(described_class.call(params: invalid_params)).to be_failure }

    it { expect { described_class.call(params: invalid_params) }.not_to change(User, :count) }
  end
end
