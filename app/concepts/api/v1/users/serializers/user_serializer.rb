class Api::V1::Users::Serializers::UserSerializer < Api::V1::Lib::Serializers::BaseSerializer

  set_type :user
  attributes :username
  has_many :projects
end
