RSpec.describe Api::V1::Tasks::Operations::Show, type: :operations do
  subject(:operation) { described_class.call(params: params, current_user: user) }

  let!(:user) { create(:user) }
  let!(:project) { create(:project, :with_tasks, user: user) }
  let!(:task) { project.tasks.first }
  let(:params) { { id: task.id } }

  describe 'Success' do
    it { is_expected.to be_success }
  end

  describe 'Failure' do
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
