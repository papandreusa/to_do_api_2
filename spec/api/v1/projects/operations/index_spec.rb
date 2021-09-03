RSpec.describe Api::V1::Projects::Operations::Index, type: :operations do
  subject(:operation) { described_class.call(params: params, current_user: user) }

  let!(:user) { create(:user) }
  let(:params) { {} }

  before { create_list(:project, 2, user: user) }

  describe 'Success' do
    it { is_expected.to be_success }
  end
end
