RSpec.describe Api::V1::Projects::Operations::Create, type: :operations do
  let!(:user) { create(:user) }

  describe 'success' do
    let(:valid_params) { { name: FFaker::Lorem.word } }

    it { expect(described_class.call(params: valid_params, current_user: user)).to be_success }
    it { expect { described_class.call(params: valid_params, current_user: user) }.to change(Project, :count).by(1) }
  end

  describe 'failure ' do
    let(:valid_params) { { name: FFaker::Lorem.word } }

    context 'when validation fails' do
      let(:invalid_params) { { name: nil } }

      it { expect(described_class.call(params: invalid_params, current_user: user)).to be_failure }
    end
  end
end
