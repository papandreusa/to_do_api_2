RSpec.describe Api::V1::Users::Contracts::Create do
  subject(:contract) { described_class.new(User.new) }

  let(:password) { FFaker::Internet.password(8) }
  let(:username) { FFaker::Internet.user_name }

  it 'has error message' do
    expect { contract.validate({}) }
      .to change { contract.errors.messages[:username]&.include?(I18n.t('errors.be_filled')) }.to(true)
      .and change { contract.errors.messages[:password]&.include?(I18n.t('errors.be_filled')) }.to(true)
  end

  context 'when params are valid' do
    it 'valids' do
      expect(contract.validate({ username: username,
                                 password: password,
                                 password_confirmation: password })).to be_truthy
    end
  end

  describe 'invalid username' do
    let(:username) { 'a' * Api::V1::Users::Constants::USERNAME_MIN.pred }

    it 'has username error' do
      expect do
        contract.validate({ username: username,
                            password: password,
                            password_confirmation: password })
      end.to change {
        contract.errors.messages[:username]&.include?(I18n.t('errors.not_less',
                                                             number: Api::V1::Users::Constants::USERNAME_MIN))
      }.to(true)
    end
  end

  describe 'invalid password' do
    let(:password) { 'a' * Api::V1::Users::Constants::PASSWORD_MIN.pred }

    it 'has password error' do
      expect do
        contract.validate({ username: username,
                            password: password,
                            password_confirmation: password })
      end.to change {
        contract.errors.messages[:password]&.include?(I18n.t('errors.invalid_format',
                                                             number: Api::V1::Users::Constants::PASSWORD_MIN))
      }.to(true)
    end
  end

  describe 'invalid password_confirmation' do
    let(:password_confirmation) { 'a' }

    it 'has password_confirmation error' do
      expect do
        contract.validate({ username: username,
                            password: password,
                            password_confirmation: password_confirmation })
      end.to change {
        contract.errors.messages[:password_confirmation]&.include?(I18n.t('errors.the_same_as', field: :password))
      }.to(true)
    end
  end
end
