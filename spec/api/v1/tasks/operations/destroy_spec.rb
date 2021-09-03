RSpec.describe Api::V1::Tasks::Operations::Destroy, type: :operations do
  subject(:operation) { described_class.call(params: params, current_user: user) }

  let(:user) { create(:user) }
  let!(:project) { create(:project, :with_tasks, user: user) }
  let!(:task) { create(:task, project: project) }
  let(:params) { { id: task.id } }

  describe 'Success' do
    it { is_expected.to be_success }

    it 'changes count of tasks' do
      expect { operation }.to(change(project.tasks, :count).by(-1))
    end
  end

  describe 'Failure ' do
    it_behaves_like 'task not found'
    it_behaves_like 'task created by other user'
  end
end
