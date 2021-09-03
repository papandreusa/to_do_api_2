RSpec.describe Api::V1::Comments::Decorators::CommentDecorator, type: :decorator do
  let(:task) { create(:task) }
  let(:comment) { create(:comment, :with_images, task: task) }

  describe '.instance_url' do
    it { expect(described_class.instance_url(comment)).to eq api_v1_task_comments_path(comment) }
  end

  describe '.collection_url' do
    it { expect(described_class.collection_url(task)).to eq api_v1_task_comments_path(task) }
  end

  describe '.image_url' do
    it 'returns url of image' do
      expect(described_class.image_url(comment.images.first))
        .to eq rails_blob_url(comment.images.first, only_path: true)
    end
  end
end
