class Api::V1::Lib::Serializer::ProjectSerializer
  include JSONAPI::Serializer

  set_type :project  # optional
  set_id :user_id # optional
  attributes :name
  belongs_to :user
end
