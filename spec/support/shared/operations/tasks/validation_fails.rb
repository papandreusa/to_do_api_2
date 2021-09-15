RSpec.shared_examples 'task validation fails' do
  let(:params) { { name: '', project_id: project.id } }
  it { is_expected.to be_failure }
end
