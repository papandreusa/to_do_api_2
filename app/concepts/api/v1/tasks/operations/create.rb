class Api::V1::Tasks::Operations::Create < Trailblazer::Operation
  step :find_project
  step :model
  step Policy::Pundit(Api::V1::Tasks::Policies::TaskPolicy, :create?)
  step Contract::Build(constant: Api::V1::Tasks::Contracts::Create)
  step Contract::Validate()
  step Contract::Persist()
  step Api::V1::Lib::Macro::AssignData(serializer: Api::V1::Tasks::Serializers::TaskSerializer)

  def find_project(ctx, params:, **)
    ctx[:project] = Project.find_by(id: params[:project_id])
  end

  def model(ctx, project:, **)
    ctx[:model] = project.tasks.new
  end
end
