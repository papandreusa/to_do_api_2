RSpec.describe Api::V1::Tasks::Operations::Update, type: :operations do
  subject(:operation) { described_class.call(params: params, current_user: user) }

  let!(:user) { create(:user) }
  let!(:project) { create(:project, user: user) }
  let!(:task) { create(:task, project: project) }
  let(:params) { { id: task.id, name: FFaker::Lorem.word, due_date: Time.zone.today } }

  describe 'Success' do
    it { is_expected.to be_success }

    it 'change task`s attrs' do
      expect { operation }.to change { task.reload.name }.and(change { task.reload.due_date })
    end
  end

  describe 'Failure' do
    context 'when validation fails' do
      let(:params) { { id: task.id, due_date: 'string' } }

      it { expect(operation['contract.default'].errors.messages[:due_date]).to match_array('must be a date') }
      it { is_expected.to be_failure }
    end

    context 'when task is not found' do
      let(:task) { build(:task, id: 'invalid id') }

      it { expect(operation['model']).to be_nil }
      it { is_expected.to be_failure }
    end

    context 'when task created by other user' do
      let!(:task) { create(:task) }

      it { expect(operation['result.policy.default']).to be_failure }
      it { is_expected.to be_failure }
    end
  end
end
