class Api::V1::Lib::Serializer::UserSerializer
  include ::JSONAPI::Serializer

  set_type :user  # optional
  attributes :username
  has_many :projects
end
