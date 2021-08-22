class Api::V1::Projects::Operations::Index < Api::V1::Lib::Operations::BaseOperation
  include Api::V1::Projects
  include Pagy::Backend

  step Subprocess(Api::V1::Lib::Operations::Authenticate)
  step Policy::Pundit(Policies::ProjectPolicy, :index?)
  step :assign_collection!
  pass :assign_data

  private

  def assign_collection!(options, current_user:, **)
    options[:model] = Project.new
    options[:pagy], options[:collection] = pagy(Policies::ProjectPolicy::Scope.new(current_user, Project).resolve)
  end

  def assign_data(options, params:, **)
    options[:data] = Serializers::ProjectSerializer.new(options[:collection], serializer_options(params))
  end

  def serializer_options(params)
    opts = {}
    opts[:links] = { self: Decorators::ProjectDecorator.collection_url(params) }
    opts
  end
end
