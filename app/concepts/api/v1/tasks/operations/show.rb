class Api::V1::Tasks::Operations::Show < Trailblazer::Operation
  step Model(Task, :find_by)
  step Policy::Pundit(Api::V1::Tasks::Policies::TaskPolicy, :show?)
  step Api::V1::Lib::Macro::AssignData(serializer: Api::V1::Tasks::Serializers::TaskSerializer)
end
