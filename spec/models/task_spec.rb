RSpec.describe Task, type: :model do
  subject(:task) { create(:task) }

  describe 'fields' do
    it { is_expected.to have_db_column(:name).of_type(:string) }
    it { is_expected.to have_db_column(:position).of_type(:integer) }
    it { is_expected.to have_db_column(:done).of_type(:boolean) }
    it { is_expected.to have_db_column(:due_date).of_type(:date) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:project) }
    it { is_expected.to have_many(:comments) }
  end
end
