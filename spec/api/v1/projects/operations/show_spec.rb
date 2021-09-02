RSpec.describe Api::V1::Projects::Operations::Show, type: :operations do
  subject(:operation) { described_class.call(params: params, current_user: user) }

  let!(:user) { create(:user) }
  let!(:project) { create(:project, user: user) }

  describe 'success' do
    let(:params) { { id: project.id } }

    it { is_expected.to be_success }
  end

  describe 'failure ' do
    context 'when project created by other user' do
      let!(:project) { create(:project) }
      let(:params) { { id: project.id } }

      it { is_expected.to be_failure }
    end
  end
end
