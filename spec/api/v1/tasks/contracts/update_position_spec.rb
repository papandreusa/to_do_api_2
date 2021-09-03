RSpec.describe Api::V1::Tasks::Contracts::UpdatePosition do
  subject(:validation) { contract.validate(params) }

  let!(:contract) { described_class.new(task) }
  let!(:project) { create(:project, :with_tasks) }
  let!(:task) { create(:task, project: project) }

  context 'when invalid type of position' do
    let(:params) { { position: 'invalid position' } }

    it 'has errors' do
      expect { validation }.to change {
        contract.errors.messages[:position]&.include?\
          I18n.t('errors.be_integer')
      }.to(true)
    end
  end

  context 'when invalid position' do
    let(:max_position) { project.tasks_count }
    let(:params) { { position: max_position.next } }

    it 'has errors' do
      expect { validation }.to change {
        contract.errors.messages[:position]&.include?\
          I18n.t('errors.be_between', min: Api::V1::Tasks::Constants::POSITION_MIN,
                                      max: max_position)
      }.to(true)
    end
  end
end
