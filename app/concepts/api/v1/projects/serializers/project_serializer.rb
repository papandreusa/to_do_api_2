class Api::V1::Projects::Serializers::ProjectSerializer < Api::V1::Lib::Serializers::BaseSerializer
  include Api::V1::Projects

  set_type :project
  set_id :id
  attributes :name
  belongs_to :user, serializer: Api::V1::Users::Serializers::UserSerializer

  link :self do |object|
    Decorators::ProjectDecorator.new(object).public_url
  end

  def initialize(resource, options = {})
    options.empty? ? super : super(resource, collection_options(params: options[:params], pagy: options[:pagy]))
  end

  def collection_options(params:, pagy:)
    options = {}
    options[:links] = Decorators::ProjectDecorator.collection_url(params) if params
    options[:meta] = { page: { page: pagy.page, limit: pagy.items, pages: pagy.pages, total: pagy.count } } if pagy
    options
  end
end
