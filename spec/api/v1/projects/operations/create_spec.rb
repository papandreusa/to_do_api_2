RSpec.describe Api::V1::Projects::Operations::Create, type: :operations do
  subject(:operation) { described_class.call(params: params, current_user: user) }

  let!(:user) { create(:user) }

  describe 'success' do
    let(:params) { { name: FFaker::Lorem.word } }

    it { is_expected.to be_success }
    it { expect { operation }.to change(Project, :count).by(1) }
  end

  describe 'failure ' do
    context 'when validation fails' do
      let(:params) { { name: nil } }

      it { is_expected.to be_failure }
    end
  end
end
