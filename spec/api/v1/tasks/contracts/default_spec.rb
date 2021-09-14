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

    before { contract.validate(params) }

    it { expect(contract.errors.messages[:name]).to be_include 'must be filled' }
  end

  context 'when invalid type of due_date' do
    let(:params) { { due_date: 'invalid due date' } }

    before { contract.validate(params) }

    it { expect(contract.errors.messages[:due_date]).to be_include 'must be a date' }
  end
end
