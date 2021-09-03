RSpec.describe Api::V1::Tasks::Operations::Update, type: :operations do
  subject(:operation) { described_class.call(params: params, current_user: user) }

  let!(:user) { create(:user) }
  let!(:project) { create(:project, user: user) }
  let!(:task) { create(:task, project: project) }
  let(:params) { { id: task.id, name: FFaker::Lorem.word, due_date: Time.zone.today } }

  describe 'Success' do
    it { is_expected.to be_success }

    it 'change task`s attrs' do
      expect do
        operation
      end.to change { task.reload.name }.and(change { task.reload.due_date })
    end
  end

  describe 'Failure ' do
    it_behaves_like 'task validation fails' do
      let(:params) { { task_id: task.id, due_date: 'string' } }
    end

    it_behaves_like 'task created by other user'
    it_behaves_like 'task not found'
  end
end
