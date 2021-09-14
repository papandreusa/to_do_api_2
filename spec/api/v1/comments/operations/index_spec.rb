RSpec.describe Api::V1::Comments::Operations::Index, type: :operations do
  subject(:operation) { described_class.call(params: params, current_user: user) }

  let!(:user) { create(:user) }
  let!(:project) { create(:project, user: user) }
  let!(:task) { create(:task, :with_comments, project: project) }
  let(:params) { { task_id: task.id } }

  describe 'Success' do
    it { is_expected.to be_success }
  end

  describe 'Failure' do
    context 'when task is not found' do
      let(:task) { build(:task, id: 'invalid id') }

      it { expect(operation['model']).to be_nil }
    end
  end
end
