RSpec.describe Api::V1::Users::Operations::Create, type: :operations do
  subject(:operation) { described_class.call(params: params) }

  let(:user) { build(:user) }

  describe 'Success' do
    let(:params) { { username: user.username, password: user.password, password_confirmation: user.password } }

    it { is_expected.to be_success }

    it 'creates user' do
      expect { operation }.to change(User, :count).from(0).to(1)
    end
  end

  describe 'Failure' do
    let(:params) { { username: 'us', password: 'short', password_confirmation: 'foo' } }

    it { is_expected.to be_failure }

    it { expect { operation }.not_to change(User, :count) }
  end
end
