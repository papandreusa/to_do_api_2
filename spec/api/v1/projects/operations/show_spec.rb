RSpec.describe Api::V1::Projects::Operations::Show, type: :operations do
  let!(:user) { create(:user) }
  let!(:project) { create(:project, user: user) }
  let(:valid_params) { { id: project.id } }

  describe 'success' do
    it { expect(described_class.call(params: valid_params, current_user: user)).to be_success }
  end

  describe 'failure ' do
    context 'when project created by other user' do
      let!(:project) { create(:project) }
      let(:valid_params) { { id: project.id } }

      it { expect(described_class.call(params: valid_params, current_user: user)).to be_failure }
    end
  end
end
