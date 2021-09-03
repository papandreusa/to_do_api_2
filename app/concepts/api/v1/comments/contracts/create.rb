class Api::V1::Comments::Contracts::Create < Reform::Form
  property :body
  property :images

  validation name: :default do
    params do
      required(:body).filled(min_size?: Api::V1::Comments::Constants::BODY_MIN,
                             max_size?: Api::V1::Comments::Constants::BODY_MAX)
      optional(:images)
    end

    rule(:images) do
      values[:images].each do |image|
        if image.present? && (image.size > Api::V1::Comments::Constants::IMAGE_MAX)
          key.failure(I18n.t('errors.invalid_file_size'))
          break
        end
      end
    end
  end
end
