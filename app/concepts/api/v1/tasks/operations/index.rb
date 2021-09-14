class Api::V1::Tasks::Operations::Index < Trailblazer::Operation
  step :model
  step Policy::Pundit(Api::V1::Projects::Policies::ProjectPolicy, :tasks?)
  step :assign_collection
  step Api::V1::Lib::Macro::AssignData(serializer: Api::V1::Tasks::Serializers::TaskSerializer,
                                       type: :collection,
                                       project: :model,
                                       params: :params)

  def model(ctx, params:, **)
    ctx[:model] = Project.find_by(id: params[:project_id])
  end

  def assign_collection(ctx, current_user:, model:, params:, **)
    ctx[:collection] =
      Api::V1::Tasks::Queries::FetchTasks.call(current_user: current_user, project: model, params: params)
  end
end
