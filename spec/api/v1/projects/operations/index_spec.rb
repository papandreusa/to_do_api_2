RSpec.describe Api::V1::Projects::Operations::Index, type: :operations do
  let!(:user) { create(:user) }
  let(:params) { {} }

  before { create_list(:project, 2, user: user) }

  describe 'success' do
    it { expect(described_class.call(params: params, current_user: user)).to be_success }
  end
end
