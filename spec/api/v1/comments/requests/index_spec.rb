RSpec.describe 'GET Comments', type: :request do
  include Docs::V1::Comments::Api
  include Docs::V1::Comments::Index

  let!(:user) { create(:user) }
  let!(:project) { create(:project, user: user) }
  let!(:task) { create(:task, :with_comments, project: project) }

  before do
    get api_v1_task_comments_path(task), headers: headers
  end

  describe 'Success result' do
    include_examples 'has success status', schema: 'v1/comments/index'
  end

  describe 'Failure' do
    context 'when user is unauthenticated' do
      include_examples 'has unauthorized status'
    end

    context 'when access invalid task' do
      let(:task) { build(:task, id: 'invalid id') }

      include_examples 'has not found status'
    end
  end
end
