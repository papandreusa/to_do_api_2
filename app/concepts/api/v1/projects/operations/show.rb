class Api::V1::Projects::Operations::Show < Trailblazer::Operation
  step Model(Project, :find_by)
  step Policy::Pundit(Api::V1::Projects::Policies::ProjectPolicy, :show?)
  step Api::V1::Lib::Macro::AssignData(serializer: Api::V1::Projects::Serializers::ProjectSerializer)
end
