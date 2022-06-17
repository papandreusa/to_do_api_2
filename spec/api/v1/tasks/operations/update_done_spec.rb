RSpec.describe Api::V1::Tasks::Operations::UpdateDone, type: :operations do
  subject(:operation) { described_class.call(params: params, current_user: user) }

  let!(:user) { create(:user) }
  let!(:project) { create(:project, user: user) }
  let!(:task) { create(:task, project: project, done: false) }
  let(:params) { { task_id: task.id } }

  describe 'Success' do
    it { is_expected.to be_success }

    it 'change task`s status to done' do
      expect { operation }.to(change { task.reload.done }.from(false).to(true))
    end
  end

  describe 'failure' do
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
