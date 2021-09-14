class Api::V1::Comments::Contracts::Create < Reform::Form
  property :body
  property :images

  validation name: :default do
    params do
      required(:body).filled(min_size?: Api::V1::Constants::Comment::BODY_MIN,
                             max_size?: Api::V1::Constants::Comment::BODY_MAX)
      optional(:images)
    end

    rule(:images) do
      if values[:images].any? { |image| image.size > Api::V1::Constants::Comment::IMAGE_MAX }
        key.failure(I18n.t('errors.invalid_file_size'))
      end
    end
  end
end
