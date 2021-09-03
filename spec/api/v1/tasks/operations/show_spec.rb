RSpec.describe Api::V1::Tasks::Operations::Show, type: :operations do
  subject(:operation) { described_class.call(params: params, current_user: user) }

  let!(:user) { create(:user) }
  let!(:project) { create(:project, :with_tasks, user: user) }
  let!(:task) { project.tasks.first }
  let(:params) { { id: task.id } }

  describe 'Success' do
    it { is_expected.to be_success }
  end

  describe 'Failure ' do
    it_behaves_like 'task created by other user'
    it_behaves_like 'task not found'
  end
end
