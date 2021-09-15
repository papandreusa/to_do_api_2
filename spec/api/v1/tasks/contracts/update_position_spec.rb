RSpec.describe Api::V1::Tasks::Contracts::UpdatePosition do
  subject(:validation) { contract.validate(params) }

  let!(:contract) { described_class.new(task) }
  let!(:project) { create(:project, :with_tasks) }
  let!(:task) { create(:task, project: project) }

  context 'when params is valid' do
    let(:params) { { position: 1 } }

    it { is_expected.to be_truthy }
  end

  context 'when invalid type of position' do
    let(:params) { { position: 'invalid position' } }

    before { contract.validate(params) }

    it 'has errors' do
      expect(contract.errors.messages[:position])
        .to match_array(['must be an integer', 'must be greater than or equal to 1'])
    end
  end

  context 'when invalid position' do
    let(:max_position) { project.tasks_count }
    let(:params) { { position: max_position.next } }

    before { contract.validate(params) }

    it { expect(contract.errors.messages[:position]).to match_array ['must be less than or equal to 3'] }
  end
end
