class Api::V1::Tasks::Operations::Update < Trailblazer::Operation
  step Model(Task, :find_by)
  step Policy::Pundit(Api::V1::Tasks::Policies::TaskPolicy, :update?)
  step Contract::Build(constant: Api::V1::Tasks::Contracts::Update)
  step Contract::Validate()
  step Contract::Persist()
  step Api::V1::Lib::Macro::AssignData(serializer: Api::V1::Tasks::Serializers::TaskSerializer)
end
