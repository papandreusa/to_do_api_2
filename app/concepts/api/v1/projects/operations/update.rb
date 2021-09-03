class Api::V1::Projects::Operations::Update < Trailblazer::Operation
  step Model(Project, :find_by)
  step Policy::Pundit(Api::V1::Projects::Policies::ProjectPolicy, :update?)
  step Contract::Build(constant: Api::V1::Projects::Contracts::Default)
  step Contract::Validate()
  step Contract::Persist()
  step Api::V1::Lib::Macro::AssignData(serializer: Api::V1::Projects::Serializers::ProjectSerializer)
end
