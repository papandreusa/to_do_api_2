class Api::V1::Tasks::Operations::UpdatePosition < Trailblazer::Operation
  step :model
  step Policy::Pundit(Api::V1::Tasks::Policies::TaskPolicy, :update?)
  step Contract::Build(constant: Api::V1::Tasks::Contracts::UpdatePosition)
  step Contract::Validate()
  step :update_position
  step Api::V1::Lib::Macro::AssignData(serializer: Api::V1::Tasks::Serializers::TaskSerializer)

  def model(ctx, params:, **)
    ctx[:model] = Task.find_by(id: params[:task_id])
  end

  def update_position(_ctx, params:, model:, **)
    model.update(position: params[:position])
  end
end
