class Api::V1::Projects::Operations::Create < Trailblazer::Operation
  step :model
  step Policy::Pundit(Api::V1::Projects::Policies::ProjectPolicy, :create?)
  step Contract::Build(constant: Api::V1::Projects::Contracts::Default)
  step Contract::Validate()
  step Contract::Persist()
  step Api::V1::Lib::Macro::AssignData(serializer: Api::V1::Projects::Serializers::ProjectSerializer)

  def model(ctx, current_user:, **)
    ctx[:model] = current_user.projects.new
  end
end
