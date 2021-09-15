RSpec.describe Api::V1::Comments::Contracts::Create do
  subject(:validation) { contract.validate(params) }

  let(:contract) { described_class.new(Comment.new) }
  let(:params) { { body: body, images: images } }
  let(:images) { [Rack::Test::UploadedFile.new(Rails.root.join(SpecConstants::Comment::TEST_IMAGE), 'image/jpg')] }
  let(:body) { 'a' * Api::V1::Constants::Comment::BODY_MIN }

  describe 'Success' do
    context 'when params is valid' do
      it { is_expected.to be_truthy }
    end
  end

  describe 'Failure' do
    context 'when body is invalid' do
      let(:params) { { body: 'a' * Api::V1::Constants::Comment::BODY_MIN.pred } }

      before { validation }

      it 'has error message' do
        expect(contract.errors.messages[:body])
          .to match_array(['size cannot be less than 10', 'size cannot be greater than 256'])
      end
    end

    context 'when image is too big' do
      let(:body) { 'a' * Api::V1::Constants::Comment::BODY_MIN }

      before do
        allow(images.first).to receive(:size) { Api::V1::Constants::Comment::IMAGE_MAX.next }
        validation
      end

      it 'has error message' do
        expect(contract.errors.messages[:images])
          .to match_array(['file size is tooo big'])
      end
    end
  end
end