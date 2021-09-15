class Api::V1::Tasks::Operations::UpdateDone < Trailblazer::Operation
  step :model
  step Policy::Pundit(Api::V1::Tasks::Policies::TaskPolicy, :update?)
  step :mark_complete
  step Api::V1::Lib::Macro::AssignData(serializer: Api::V1::Tasks::Serializers::TaskSerializer)

  def model(ctx, params:, **)
    ctx[:model] = Task.find_by(id: params[:task_id])
  end

  def mark_complete(_ctx, model:, **)
    model.update(done: true)
  end
end
