RSpec.describe Api::V1::Comments::Serializers::CommentSerializer, type: :serializer do
  subject(:serializer) { described_class.new(*args).to_json }

  let(:task) { create(:task, :with_comments) }
  let(:comment) { create(:comment, :with_images, task: task) }

  describe 'instance' do
    let(:args) { comment }

    it { is_expected.to match_json_schema('v1/comments/instance') }
  end

  describe 'collection' do
    let(:args) { [task.comments, { task: task }] }

    it { is_expected.to match_json_schema('v1/comments/collection') }
  end
end
