class Api::V1::Comments::Operations::Create < Trailblazer::Operation
  step :find_task
  pass :model
  step Policy::Pundit(Api::V1::Comments::Policies::CommentPolicy, :create?)
  step Contract::Build(constant: Api::V1::Comments::Contracts::Create)
  step Contract::Validate()
  step Contract::Persist()
  step Api::V1::Lib::Macro::AssignData(serializer: Api::V1::Comments::Serializers::CommentSerializer)

  def find_task(ctx, params:, **)
    ctx[:task] = Task.find_by(id: params[:task_id])
  end

  def model(ctx, task:, **)
    ctx[:model] = task.comments.new
  end
end
