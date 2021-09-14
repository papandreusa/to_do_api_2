RSpec.describe Api::V1::Tasks::Operations::Create, type: :operations do
  subject(:operation) { described_class.call(params: params, current_user: user) }

  let!(:user) { create(:user) }
  let!(:project) { create(:project, user: user) }
  let(:params) { { name: FFaker::Lorem.word, project_id: project.id } }

  describe 'Success' do
    it { is_expected.to be_success }

    it 'changes tasks` count' do
      expect { operation }.to change(project.tasks, :count).from(0).to(1)
    end
  end

  describe 'Failure ' do
    context 'when validation fails' do
      let(:params) { { name: '', project_id: project.id } }

      it { expect(operation['contract.default'].errors.messages[:name]).to be_include('must be filled') }
    end

    context 'when project is not found' do
      let(:project) { build(:project, id: 'invalid id') }

      it { expect(operation['model']).to be_nil }
    end

    context 'when project created by other user' do
      let!(:project) { create(:project) }

      it { expect(operation['result.policy.default']).to be_failure }
    end
  end
end
