RSpec.describe 'GET Projects', type: :request do
  include Docs::V1::Projects::Api
  include Docs::V1::Projects::Index

  let!(:user) { create(:user) }

  before do
    create_list(:project, 2, user: user)
    get api_v1_projects_path, headers: headers
  end

  describe 'Success' do
    include_examples 'has success status', schema: 'v1/projects/collection'
  end

  describe 'Failure' do
    context 'when user is unauthenticated' do
      include_examples 'has unauthorized status'
    end
  end
end
