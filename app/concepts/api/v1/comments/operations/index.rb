class Api::V1::Comments::Operations::Index < Trailblazer::Operation
  include Pagy::Backend

  step :model
  step :assign_collection
  step Api::V1::Lib::Macro::AssignData(serializer: Api::V1::Comments::Serializers::CommentSerializer, type: :collection)

  def model(ctx, params:, **)
    ctx[:model] = Task.find_by(id: params[:task_id])
  end

  def assign_collection(ctx, current_user:, model:, **)
    ctx[:collection] = Api::V1::Comments::Policies::CommentPolicy::Scope.new(current_user, model.comments).resolve
  end
end
