RSpec.describe Api::V1::Projects::Contracts::Update do
  subject(:contract) { described_class.new(project) }

  let(:project) { create(:project) }
  let(:name) { '' }

  context 'when name is invalid' do
    it 'has error message' do
      expect { contract.validate({ name: name }) }
        .to change { contract.errors.messages[:name] }.to([I18n.t('errors.be_filled')])
    end
  end

  context 'when params are valid' do
    it { expect(contract.validate({ name: FFaker::Lorem.word })).to be_truthy }
  end
end
