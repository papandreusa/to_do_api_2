RSpec.describe Api::V1::Comments::Operations::Create, type: :operations do
  subject(:operation) { described_class.call(params: params, current_user: user) }

  let!(:user) { create(:user) }
  let(:project) { create(:project, user: user) }
  let!(:task) { create(:task, :with_comments, project: project) }
  let(:params) { { body: FFaker::Lorem.sentence, task_id: task.id } }

  describe 'Success' do
    it { is_expected.to be_success }

    it 'increase comments` count' do
      expect { operation }.to change(task.comments, :count).by(1)
    end
  end

  describe 'Failure' do
    it_behaves_like 'comment validation fails'
    it_behaves_like 'task not found'
    it_behaves_like 'task created by other user'
  end
end
