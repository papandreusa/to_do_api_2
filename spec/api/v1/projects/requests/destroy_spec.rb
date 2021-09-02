RSpec.describe 'Delete Project', type: :request do
  include Docs::V1::Projects::Api
  include Docs::V1::Projects::Destroy

  let!(:user) { create(:user) }
  let!(:project) { create(:project, user: user) }

  before do
    delete api_v1_project_path(project.id), headers: headers
  end

  describe 'Success' do
    include_examples 'has no content status'
  end

  describe 'Failure' do
    context 'when user is unauthenticated' do
      include_examples 'has unauthorized status'
    end

    context 'when access invalid project' do
      let(:project) { build(:project, id: 'invalid id') }

      include_examples 'has not found status'
    end

    context 'when access project of other user' do
      let!(:project) { create(:project) }

      include_examples 'has forbidden status'
    end
  end
end
