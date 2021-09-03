RSpec.shared_examples 'project not found' do
  let(:project) { build(:project, id: 'invalid') }

  it { is_expected.to be_failure }
end
