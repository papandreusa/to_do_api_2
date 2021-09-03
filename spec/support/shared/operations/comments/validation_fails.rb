RSpec.shared_examples 'comment validation fails' do
  context 'when body is invalid' do
    let(:params) { { body: 'a' * Api::V1::Comments::Constants::BODY_MIN.pred, task_id: task.id } }

    it { is_expected.to be_failure }
  end

  context 'when image is too big' do
    let(:params) { { body: body, images: images, task_id: task.id } }
    let(:images) { [Rack::Test::UploadedFile.new(Rails.root.join(SpecConstants::Comments::TEST_IMAGE), 'image/jpg')] }
    let(:body) { 'a' * Api::V1::Comments::Constants::BODY_MIN }

    before do
      allow(images.first).to receive(:size) { Api::V1::Comments::Constants::IMAGE_MAX.next }
    end

    it { is_expected.to be_failure }
  end
end
