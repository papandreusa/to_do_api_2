class Api::V1::Comments::Decorators::CommentDecorator < Api::V1::Lib::Decorators::BaseDecorator
  delegate :body

  class << self
    def instance_url(comment)
      h.api_v1_task_comments_path(comment)
    end

    def collection_url(task, **params)
      h.api_v1_task_comments_path(task, **permitted_params(params))
    end

    def image_url(image)
      h.rails_blob_url(image, only_path: true) if image.present?
    end
  end
end
