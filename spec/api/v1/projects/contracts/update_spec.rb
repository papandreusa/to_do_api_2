RSpec.describe Api::V1::Projects::Contracts::Update do
  subject(:validation) { contract.validate(params) }

  let(:contract) { described_class.new(project) }
  let(:project) { create(:project) }

  context 'when name is invalid' do
    let(:params) { { name: '' } }

    it 'has error message' do
      expect { validation }
        .to change { contract.errors.messages[:name]&.include? I18n.t('errors.be_filled') }.to(true)
    end
  end

  context 'when params are valid' do
    let(:params) { { name: FFaker::Lorem.word } }

    it { expect(params).to be_truthy }
  end
end
