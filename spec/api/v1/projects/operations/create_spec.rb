RSpec.describe Api::V1::Projects::Operations::Create, type: :operations do
  subject(:operation) { described_class.call(params: params, current_user: user) }

  let!(:user) { create(:user) }
  let(:params) { { name: FFaker::Lorem.word } }

  describe 'Success' do
    it { is_expected.to be_success }
    it { expect { operation }.to change(Project, :count).from(0).to(1) }
  end

  describe 'Failure' do
    it_behaves_like 'project validation fails'
  end
end
