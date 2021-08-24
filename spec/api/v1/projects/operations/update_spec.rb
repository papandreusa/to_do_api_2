RSpec.describe Api::V1::Projects::Operations::Update, type: :operations do
  let!(:user) { create(:user) }
  let!(:project) { create(:project, user: user) }

  describe 'success' do
    let(:valid_params) { { id: project.id, name: FFaker::Lorem.word } }

    it { expect(described_class.call(params: valid_params, current_user: user)).to be_success }
    it { expect { described_class.call(params: valid_params, current_user: user) }.to(change { project.reload.name }) }
  end

  describe 'failure ' do
    context 'when validation fails' do
      let(:invalid_params) { { name: nil } }

      it { expect(described_class.call(params: invalid_params, current_user: user)).to be_failure }
    end
  end
end
