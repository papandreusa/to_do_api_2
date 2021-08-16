class Api::V1::Projects::Serializers::ProjectSerializer < Api::V1::Lib::Serializers::BaseSerializer

  set_type :project  
  set_id :user_id
  attributes :name
  belongs_to :user, serializer: Api::V1::Users::Serializers::UserSerializer
  
  link :url do
    Api::V1::Projects::Decorators::ProjectDecorator.new(self).public_url
  end 
end