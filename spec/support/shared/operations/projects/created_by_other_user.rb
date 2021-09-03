RSpec.shared_examples 'project created by other user' do
  let(:project) { create(:project) }

  it { is_expected.to be_failure }
end
