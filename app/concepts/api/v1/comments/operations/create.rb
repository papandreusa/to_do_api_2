class Api::V1::Comments::Operations::Create < Trailblazer::Operation
  step :find_task
  pass :model
  step Policy::Pundit(Api::V1::Comments::Policies::CommentPolicy, :create?)
  step Contract::Build(constant: Api::V1::Comments::Contracts::Create)
  step Contract::Validate()
  step :save_data
  step Api::V1::Lib::Macro::AssignData(serializer: Api::V1::Comments::Serializers::CommentSerializer)

  def find_task(ctx, params:, **)
    ctx[:task] = Task.find_by(id: params[:task_id])
  end

  def model(ctx, task:, **)
    ctx[:model] = task.comments.new
  end

  def save_data(ctx, params:, **)
    ctx['contract.default'].save do |fields|
      if params[:images].present?
        ctx['contract.default'].model.update(fields)
      else
        ctx['contract.default'].model.update(fields.symbolize_keys.slice(:body))
      end
    end
  end
end
