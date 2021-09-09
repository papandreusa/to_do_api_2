RSpec.describe Api::V1::Projects::Operations::Update, type: :operations do
  subject(:operation) { described_class.call(params: params, current_user: user) }

  let!(:user) { create(:user) }
  let!(:project) { create(:project, user: user) }
  let(:params) { { id: project.id, name: FFaker::Lorem.word } }

  describe 'Success' do
    it { is_expected.to be_success }

    it 'change project name' do
      expect do
        operation
      end.to(change { project.reload.name })
    end
  end

  describe 'Failure ' do
    it_behaves_like 'project validation fails'
    it_behaves_like 'project not found'
    it_behaves_like 'project created by other user'
  end
end
