RSpec.shared_examples 'task not found' do
  let(:task) { build(:task, id: 'invalid id') }

  it { is_expected.to be_failure }
end
