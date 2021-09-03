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
      expect do
        operation
      end.to(change(task.comments, :count).by(-1))
    end
  end

  describe 'Failure' do
    it_behaves_like 'comment not found'
    it_behaves_like 'comment created by other user'
  end
end
