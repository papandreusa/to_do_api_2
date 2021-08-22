class Api::V1::Projects::Serializers::ProjectSerializer < Api::V1::Lib::Serializers::BaseSerializer
  set_type :project
  set_id :id
  attributes :name
  belongs_to :user, serializer: Api::V1::Users::Serializers::UserSerializer

  link :self do |object|
    Api::V1::Projects::Decorators::ProjectDecorator.new(object).public_url
  end
end
