RSpec.describe Api::V1::Tasks::Operations::UpdateDone, type: :operations do
  subject(:operation) { described_class.call(params: params, current_user: user) }

  let!(:user) { create(:user) }
  let!(:project) { create(:project, user: user) }
  let!(:task) { create(:task, project: project, done: false) }
  let(:params) { { task_id: task.id } }

  describe 'Success' do
    it { is_expected.to be_success }

    it 'change task`s status to done' do
      expect do
        operation
      end.to(change { task.reload.done })
    end
  end

  describe 'failure ' do
    it_behaves_like 'task created by other user'
    it_behaves_like 'task not found'
  end
end
