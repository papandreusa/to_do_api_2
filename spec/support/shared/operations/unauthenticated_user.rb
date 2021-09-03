RSpec.shared_examples 'user is unauthenticated' do
  let(:user) { nil }

  it { is_expected.to be_failure }
end
