RSpec.describe Api::V1::Projects::Contracts::Create do
  subject(:contract) { described_class.new(Project.new) }

  it 'has error message' do
    expect { contract.validate({}) }
      .to change { contract.errors.messages[:name] }.to([I18n.t('errors.be_filled')])
  end

  it { expect(contract.validate({ name: FFaker::Lorem.word })).to be_truthy }
end
