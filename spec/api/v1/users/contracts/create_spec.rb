RSpec.describe Api::V1::Users::Contracts::Create do
  subject(:validation) { contract.validate(params) }

  let(:contract) { described_class.new(User.new) }
  let(:username) { build(:user).username }
  let(:password) { Api::V1::Users::Constants::PASSWORD_REGEX.random_example }
  let(:params) { { username: username, password: password, password_confirmation: password } }

  describe 'Success' do
    context 'when params are valid' do
      it { is_expected.to be_truthy }
    end
  end

  describe 'Failure' do
    context 'when username and password are empty' do
      let(:params) { { username: '', password: '' } }

      it 'has error message' do
        expect { validation }
          .to change { contract.errors.messages[:username]&.include?(I18n.t('errors.be_filled')) }.to(true)
          .and change { contract.errors.messages[:password]&.include?(I18n.t('errors.be_filled')) }.to(true)
      end
    end

    context 'when invalid username' do
      let(:username) { 'a' * Api::V1::Users::Constants::USERNAME_MIN.pred }

      it 'has username error' do
        expect { validation }.to change {
          contract.errors.messages[:username]&.include?\
            I18n.t('errors.not_less', number: Api::V1::Users::Constants::USERNAME_MIN)
        }.to(true)
      end
    end

    context 'when invalid password' do
      let(:password) { 'a' * Api::V1::Users::Constants::PASSWORD_MIN.pred }

      it 'has password error' do
        expect { validation }.to change {
          contract.errors.messages[:password]&.include?\
            I18n.t('errors.invalid_format', number: Api::V1::Users::Constants::PASSWORD_MIN)
        }.to(true)
      end
    end

    describe 'invalid password_confirmation' do
      let(:params) { { username: username, password: password, password_confirmation: 'invalid' } }

      it 'has password_confirmation error' do
        expect { validation }.to change {
          contract.errors.messages[:password_confirmation]&.include?\
            I18n.t('errors.the_same_as', field: :password)
        }.to(true)
      end
    end
  end
end
