RSpec.describe Api::V1::Comments::Contracts::Create do
  subject(:validation) { contract.validate(params) }

  let(:contract) { described_class.new(Comment.new) }
  let(:params) { { body: body, images: images } }
  let(:images) { [Rack::Test::UploadedFile.new(Rails.root.join(SpecConstants::Comments::TEST_IMAGE), 'image/jpg')] }
  let(:body) { 'a' * Api::V1::Comments::Constants::BODY_MIN }

  describe 'Success' do
    context 'when params is valid' do
      it { is_expected.to be_truthy }
    end
  end

  describe 'Failure' do
    context 'when body is invalid' do
      let(:params) { { body: 'a' * Api::V1::Comments::Constants::BODY_MIN.pred } }

      it 'has error message' do
        expect { validation }
          .to change {
            contract.errors.messages[:body]&.include?\
              I18n.t('errors.not_less', number: Api::V1::Comments::Constants::BODY_MIN)
          }.to(true)
      end
    end

    context 'when image is too big' do
      let(:body) { 'a' * Api::V1::Comments::Constants::BODY_MIN }

      before do
        allow(images.first).to receive(:size) { Api::V1::Comments::Constants::IMAGE_MAX.next }
      end

      it 'has error message' do
        expect { validation }
          .to change {
            contract.errors.messages[:images]&.include?(I18n.t('errors.invalid_file_size'))
          }.to(true)
      end
    end
  end
end
