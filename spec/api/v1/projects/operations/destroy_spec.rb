RSpec.describe Api::V1::Projects::Operations::Destroy, type: :operations do
  let!(:user) { create(:user) }
  let!(:project) { create(:project, user: user) }

  before { create_list(:project, 2) }

  describe 'success' do
    let(:valid_params) { { id: project.id } }

    it { expect(described_class.call(params: valid_params, current_user: user)).to be_success }
    it { expect { described_class.call(params: valid_params, current_user: user) }.to(change(Project, :count).by(-1)) }
  end

  describe 'failure ' do
    context 'when project not found' do
      let(:invalid_params) { { id: -1 } }

      it { expect(described_class.call(params: invalid_params, current_user: user)).to be_failure }
    end
  end
end
