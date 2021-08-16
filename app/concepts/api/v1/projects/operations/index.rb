class Api::V1::Projects::Operations::Index < ::Api::V1::Lib::Operations::BaseOperation
  include Api::V1::Projects
  include Pagy::Backend

  step Policy::Pundit(Policies::ProjectPolicy, :index?)
  step :index!
  pass :assign_data

  private

  def index!(options, **)
    options[:model] = Project.new
    options[:pagy], options[:collection] = pagy(Policies::ProjectPolicy::Scope.new(current_user, Project).resolve)
  end

  def assign_data(options, **)
    options[:data] = Serializers::ProjectSerializer.new(options[:collection])
  end

  attr_reader :model, :params
  
end
