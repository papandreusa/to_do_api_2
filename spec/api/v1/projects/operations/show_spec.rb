RSpec.describe Api::V1::Projects::Operations::Show, type: :operations do
  subject(:operation) { described_class.call(params: params, current_user: user) }

  let!(:user) { create(:user) }
  let!(:project) { create(:project, user: user) }
  let(:params) { { id: project.id } }

  describe 'success' do
    it { is_expected.to be_success }
  end

  describe 'failure ' do
    it_behaves_like 'project not found'
    it_behaves_like 'project created by other user'
  end
end
