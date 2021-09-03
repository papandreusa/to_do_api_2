RSpec.describe 'Delete Comment', type: :request do
  include Docs::V1::Comments::Api
  include Docs::V1::Comments::Destroy

  let!(:user) { create(:user) }
  let!(:project) { create(:project, user: user) }
  let!(:task) { create(:task, project: project) }
  let!(:comment) { create(:comment, task: task) }

  before do
    delete api_v1_comment_path(comment), headers: headers
  end

  describe 'Success' do
    include_examples 'has no content status'
  end

  describe 'Failure' do
    context 'when user is unauthenticated' do
      include_examples 'has unauthorized status'
    end

    context 'when access invalid comment' do
      let(:comment) { build(:comment, id: 'invalid id') }

      include_examples 'has not found status'
    end

    context 'when access comment of other user' do
      let!(:comment) { create(:comment) }

      include_examples 'has forbidden status'
    end
  end
end
