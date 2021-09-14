RSpec.describe Api::V1::Tasks::Contracts::Default do
  subject(:validation) { contract.validate(params) }

  let(:contract) { described_class.new(task) }
  let(:task) { create(:task) }

  context 'when params is valid' do
    let(:params) { { name: FFaker::Lorem.word } }

    it { expect(contract.validate(params)).to be_truthy }
  end

  context 'when invalid name' do
    let(:params) { { name: nil } }

    it 'has error message' do
      expect { validation }.to change {
        contract.errors.messages[:name]&.include?\
          I18n.t('errors.be_filled')
      }.to(true)
    end
  end

  context 'when invalid type of due_date' do
    let(:params) { { due_date: 'invalid due date' } }

    it 'has errors' do
      expect { validation }.to change {
        contract.errors.messages[:due_date]&.include?\
          I18n.t('errors.be_date')
      }.to(true)
    end
  end
end
