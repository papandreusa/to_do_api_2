RSpec.describe Api::V1::Projects::Contracts::Default do
  subject(:validation) { contract.validate(params) }

  let(:contract) { described_class.new(Project.new) }

  context 'when params is valid' do
    let(:params) { { name: FFaker::Lorem.word } }

    it { expect(validation).to be_truthy }
  end

  context 'when params is invalid' do
    let(:params) { {} }

    it 'has error message' do
      expect { validation }
        .to change { contract.errors.messages[:name]&.include? I18n.t('errors.be_filled') }.to(true)
    end
  end
end
