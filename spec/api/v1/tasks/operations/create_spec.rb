RSpec.describe Api::V1::Tasks::Operations::Create, type: :operations do
  subject(:operation) { described_class.call(params: params, current_user: user) }

  let!(:user) { create(:user) }
  let!(:project) { create(:project, user: user) }
  let(:params) { { name: FFaker::Lorem.word, project_id: project.id } }

  describe 'Success' do
    it { is_expected.to be_success }

    it 'changes tasks` count' do
      expect { operation }.to change(project.tasks, :count).from(0).to(1)
    end
  end

  describe 'Failure ' do
    it_behaves_like 'task validation fails'
    it_behaves_like 'project not found'
    it_behaves_like 'project created by other user'
  end
end
