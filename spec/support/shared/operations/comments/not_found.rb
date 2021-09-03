RSpec.shared_examples 'comment not found' do
  let(:comment) { build(:comment, task: task, id: 'invalid id') }

  it { is_expected.to be_failure }
end
