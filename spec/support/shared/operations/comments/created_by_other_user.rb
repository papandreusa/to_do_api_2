RSpec.shared_examples 'comment created by other user' do
  let!(:task) { create(:task) }

  it { is_expected.to be_failure }
end
