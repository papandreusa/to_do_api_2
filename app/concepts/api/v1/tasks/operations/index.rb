class Api::V1::Tasks::Operations::Index < Trailblazer::Operation
  step :model
  step Policy::Pundit(Api::V1::Projects::Policies::ProjectPolicy, :tasks?)
  step :assign_collection
  step Api::V1::Lib::Macro::AssignData(serializer: Api::V1::Tasks::Serializers::TaskSerializer,
                                       type: :collection,
                                       args: %i[project params])

  def model(ctx, params:, **)
    ctx[:model] = ctx[:project] = Project.find_by(id: params[:project_id])
  end

  def assign_collection(ctx, current_user:, project:, params:, **)
    ctx[:collection] =
      Api::V1::Tasks::Services::FetchTasksService.call(current_user: current_user, project: project, params: params)
  end
end
