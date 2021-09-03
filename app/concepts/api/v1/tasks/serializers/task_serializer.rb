class Api::V1::Tasks::Serializers::TaskSerializer < Api::V1::Lib::Serializers::BaseSerializer
  set_type :task
  set_id :id
  attributes :name, :position, :due_date, :done
  belongs_to :project, serializer: Api::V1::Projects::Serializers::ProjectSerializer

  link :self do |task|
    Api::V1::Tasks::Decorators::TaskDecorator.instance_url(task)
  end

  def collection_options(project:, params: {})
    { links: Api::V1::Tasks::Decorators::TaskDecorator.collection_url(project, **params) }
  end
end
