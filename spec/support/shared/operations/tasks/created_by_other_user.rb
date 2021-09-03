RSpec.shared_examples 'task created by other user' do
  let!(:project) { create(:project) }
  let(:task) { create(:task, project: project) }

  it { is_expected.to be_failure }
end
