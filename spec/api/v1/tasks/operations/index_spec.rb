RSpec.describe Api::V1::Tasks::Operations::Index, type: :operations do
  subject(:operation) { described_class.call(params: params, current_user: user) }

  let!(:user) { create(:user) }
  let!(:project) { create(:project, :with_tasks, user: user) }
  let(:params) { { project_id: project.id } }

  describe 'Success' do
    it { is_expected.to be_success }
  end

  describe 'Failure' do
    it_behaves_like 'project created by other user'
  end
end
