RSpec.describe Project, type: :model do
  subject(:project) { create(:project) }

  describe 'fields' do
    it { is_expected.to have_db_column(:name).of_type(:string) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:tasks) }
  end
end
