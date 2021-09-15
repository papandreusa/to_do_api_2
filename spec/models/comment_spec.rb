RSpec.describe Comment, type: :model do
  describe 'fields' do
    it { is_expected.to have_db_column(:body).of_type(:text) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:task) }
    it { is_expected.to have_many_attached(:images) }
  end
end
