RSpec.describe Api::V1::Tasks::Operations::UpdatePosition, type: :operations do
  subject(:operation) { described_class.call(params: params, current_user: user) }

  let!(:user) { create(:user) }
  let!(:project) { create(:project, :with_tasks, user: user) }
  let!(:task) { create(:task, project: project, position: 1) }
  let(:params) { { task_id: task.id, position: project.tasks.count } }

  describe 'Success' do
    it { is_expected.to be_success }

    it 'change task`s position' do
      expect do
        operation
      end.to change { task.reload.position }.to(params[:position])
    end
  end

  describe 'Failure ' do
    it_behaves_like 'task validation fails' do
      let(:params) { { task_id: task.id, position: project.tasks.count.next } }
    end

    it_behaves_like 'task created by other user'
    it_behaves_like 'task not found'
  end
end
