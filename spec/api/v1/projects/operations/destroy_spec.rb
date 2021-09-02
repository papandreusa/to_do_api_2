RSpec.describe Api::V1::Projects::Operations::Destroy, type: :operations do
  subject(:operation) { described_class.call(params: params, current_user: user) }

  let!(:user) { create(:user) }
  let!(:project) { create(:project, user: user) }

  before { create_list(:project, 2) }

  describe 'success' do
    let(:params) { { id: project.id } }

    it { is_expected.to be_success }
    it { expect { operation }.to(change(Project, :count).by(-1)) }
  end

  describe 'failure ' do
    context 'when project not found' do
      let(:params) { { id: :invalid_id } }

      it { is_expected.to be_failure }
    end
  end
end
