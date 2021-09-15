class Api::V1::Comments::Decorators::CommentDecorator < Api::V1::Lib::Decorators::BaseDecorator
  delegate :body

  class << self
    def image_url(image)
      h.rails_blob_url(image, only_path: true) if image.present?
    end
  end
end
