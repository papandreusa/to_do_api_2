class Api::V1::Projects::Serializers::ProjectSerializer < Api::V1::Lib::Serializers::BaseSerializer
  include Api::V1::Projects

  set_type :project
  set_id :id
  attributes :name
  belongs_to :user, serializer: Api::V1::Users::Serializers::UserSerializer

  link :self do |project|
    Decorators::ProjectDecorator.instance_url(project)
  end

  def collection_options(pagy:, params: {})
    options = { links: Decorators::ProjectDecorator.collection_url(**params) }
    options[:meta] = { page: { page: pagy.page, limit: pagy.items, pages: pagy.pages, total: pagy.count } } if pagy
    options
  end
end
