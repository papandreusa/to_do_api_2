class Api::V1::Comments::Serializers::CommentSerializer < Api::V1::Lib::Serializers::BaseSerializer
  set_type :comment
  attributes :body
  attribute :images do |comment|
    comment.images.map do |image|
      Api::V1::Comments::Decorators::CommentDecorator.image_url(image)
    end
  end
  belongs_to :task, serializer: Api::V1::Tasks::Serializers::TaskSerializer
end
