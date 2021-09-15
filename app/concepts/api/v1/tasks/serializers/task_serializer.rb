class Api::V1::Tasks::Serializers::TaskSerializer < Api::V1::Lib::Serializers::BaseSerializer
  set_type :task
  attributes :name, :position, :due_date, :done
  belongs_to :project, serializer: Api::V1::Projects::Serializers::ProjectSerializer
end
