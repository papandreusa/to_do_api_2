class Api::V1::Projects::Operation::Index < ::Api::V1::Lib::Operation::BaseOperation
  step Policy::Pundit(Api::V1::Projects::Policy::ProjectPolicy, :index?)
  step :index!

  private

  def index!(options, **)
    options[:model] = Project.new
    projects = Api::V1::Projects::Policy::ProjectPolicy::Scope.new(current_user, Project).resolve
    options[:data] = Api::V1::Lib::Serializer::ProjectSerializer.new(projects).serializable_hash
  end

  attr_reader :model
end
