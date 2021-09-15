class Api::V1::Projects::Serializers::ProjectSerializer < Api::V1::Lib::Serializers::BaseSerializer
  set_type :project
  set_id :id
  attributes :name, :tasks_count
  belongs_to :user, serializer: Api::V1::Users::Serializers::UserSerializer

  link :self do |project|
    Api::V1::Projects::Decorators::ProjectDecorator.instance_url(project)
  end

  def collection_options(pagy: nil, params: {})
    options = { links: Api::V1::Projects::Decorators::ProjectDecorator.collection_url(**params) }
    options[:meta] = { page: { page: pagy.page, limit: pagy.items, pages: pagy.pages, total: pagy.count } } if pagy
    options
  end
end
