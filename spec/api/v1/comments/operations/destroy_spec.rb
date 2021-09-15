RSpec.describe Api::V1::Comments::Operations::Destroy, type: :operations do
  subject(:operation) { described_class.call(params: params, current_user: user) }

  let(:user) { create(:user) }
  let!(:project) { create(:project, user: user) }
  let!(:task) { create(:task, :with_comments, project: project) }
  let!(:comment) { create(:comment, task: task) }
  let(:params) { { id: comment.id } }

  describe 'Success' do
    it { is_expected.to be_success }

    it 'decrease count of comments' do
      expect { operation }.to(change(task.comments, :count).from(3).to(2))
    end
  end

  describe 'Failure' do
    context 'when comment is not found' do
      let(:comment) { build(:comment, id: 'invalid id') }

      it { expect(operation['model']).to be_nil }
      it { is_expected.to be_failure }
    end

    context 'when comment created by other user' do
      let!(:comment) { create(:comment) }

      it { expect(operation['result.policy.default']).to be_failure }
      it { is_expected.to be_failure }
    end
  end
end
