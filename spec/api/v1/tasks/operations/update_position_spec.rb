RSpec.describe Api::V1::Tasks::Operations::UpdatePosition, type: :operations do
  subject(:operation) { described_class.call(params: params, current_user: user) }

  let!(:user) { create(:user) }
  let!(:project) { create(:project, :with_tasks, user: user) }
  let!(:task) { create(:task, project: project, position: 1) }
  let(:params) { { task_id: task.id, position: project.tasks.count } }

  describe 'Success' do
    it { is_expected.to be_success }

    it 'change task`s position' do
      expect { operation }.to change { task.reload.position }.from(1).to(params[:position])
    end
  end

  describe 'Failure' do
    context 'when validation fails' do
      let(:params) { { task_id: task.id, position: project.tasks.count.next } }

      it 'has errors message' do
        expect(operation['contract.default'].errors.messages[:position])
          .to match_array(['must be less than or equal to 3'])
      end

      it { is_expected.to be_failure }
    end

    context 'when task is not found' do
      let(:task) { build(:task, id: 'invalid id') }

      it { expect(operation['model']).to be_nil }
      it { is_expected.to be_failure }
    end

    context 'when task created by other user' do
      let!(:task) { create(:task) }

      it { expect(operation['result.policy.default']).to be_failure }
      it { is_expected.to be_failure }
    end
  end
end
