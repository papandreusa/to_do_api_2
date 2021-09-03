RSpec.describe Api::V1::Projects::Operations::Destroy, type: :operations do
  subject(:operation) { described_class.call(params: params, current_user: user) }

  let!(:user) { create(:user) }
  let!(:project) { create(:project, user: user) }
  let(:params) { { id: project.id } }

  before { create_list(:project, 2) }

  describe 'Success' do
    it { is_expected.to be_success }
    it { expect { operation }.to(change(Project, :count).by(-1)) }
  end

  describe 'Failure' do
    it_behaves_like 'project not found'
    it_behaves_like 'project created by other user'
  end
end
