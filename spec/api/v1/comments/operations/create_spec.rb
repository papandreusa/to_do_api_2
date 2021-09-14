RSpec.describe Api::V1::Comments::Operations::Create, type: :operations do
  subject(:operation) { described_class.call(params: params, current_user: project.user) }

  let(:project) { create(:project) }
  let!(:task) { create(:task, :with_comments, project: project) }
  let(:params) { { body: FFaker::Lorem.sentence, task_id: task.id } }

  describe 'Success' do
    it { is_expected.to be_success }

    it 'increase comments` count' do
      expect { operation }.to change(task.comments, :count).from(2).to(3)
    end
  end

  describe 'Failure' do
    context 'when body is invalid' do
      let(:params) { { body: 'a' * Api::V1::Constants::Comment::BODY_MIN.pred, task_id: task.id } }

      it { expect(operation['contract.default'].errors.messages[:body]).to be_include('size cannot be less than 10') }
    end

    context 'when image is too big' do
      let(:params) { { body: body, images: images, task_id: task.id } }
      let(:images) { [Rack::Test::UploadedFile.new(Rails.root.join(SpecConstants::Comments::TEST_IMAGE), 'image/jpg')] }
      let(:body) { 'a' * Api::V1::Constants::Comment::BODY_MIN }

      before do
        allow(images.first).to receive(:size) { Api::V1::Constants::Comment::IMAGE_MAX.next }
      end

      it { expect(operation['contract.default'].errors.messages[:images]).to be_include('file size is tooo big') }
    end

    context 'when task is not found' do
      let(:task) { build(:task, id: 'invalid id') }

      it { expect(operation['model']).to be_nil }
    end

    context 'when task created by other user' do
      let!(:task) { create(:task) }

      it { expect(operation['result.policy.default']).to be_failure }
    end
  end
end
