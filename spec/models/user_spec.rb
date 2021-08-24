RSpec.describe User, type: :model do
  subject(:user) { create(:user) }

  describe 'fields' do
    it { is_expected.to have_db_column(:username).of_type(:string) }
    it { is_expected.to have_db_column(:password_digest).of_type(:string) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:projects) }
  end
end
