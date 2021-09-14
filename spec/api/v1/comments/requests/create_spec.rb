RSpec.describe 'Create comment', type: :request do
  include Docs::V1::Comments::Api
  include Docs::V1::Comments::Create

  let(:body) { FFaker::Lorem.word }
  let!(:user) { create(:user) }
  let(:project) { create(:project, user: user) }
  let(:task) { create(:task, project: project) }
  let(:params) do
    { body: 'a' * Api::V1::Constants::Comment::BODY_MIN,
      images: [Rack::Test::UploadedFile.new(Rails.root.join(SpecConstants::Comments::TEST_IMAGE), 'image/jpg')] }
  end

  before do
    post api_v1_task_comments_path(task), params: params, headers: headers
  end

  describe 'Success' do
    context 'when params with image is valid' do
      include_examples 'has created status', schema: 'v1/comments/show'
    end

    context 'when params without image is valid' do
      let(:params) { { body: 'a' * Api::V1::Constants::Comment::BODY_MIN }.to_json }

      include_examples 'has created status', schema: 'v1/comments/show'
    end
  end

  describe 'Failure' do
    context 'when user is unauthenticated' do
      include_examples 'has unauthorized status'
    end

    context 'when params is invalid' do
      let(:params) do
        { body: 'a' * Api::V1::Constants::Comment::BODY_MIN.pred,
          images: [Rack::Test::UploadedFile.new(Rails.root.join(SpecConstants::Comments::TEST_IMAGE), 'image/jpg')] }
      end

      include_examples 'has unprocessable entity status'
    end
  end
end
