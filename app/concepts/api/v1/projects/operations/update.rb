class Api::V1::Projects::Operations::Update < Trailblazer::Operation
  step Model(Project, :find_by)
  step Policy::Pundit(Api::V1::Projects::Policies::ProjectPolicy, :update?)
  step Contract::Build(constant: Api::V1::Projects::Contracts::Update)
  step Contract::Validate()
  step Contract::Persist()
  pass :assign_data

  def assign_data(ctx, **)
    ctx[:data] = Api::V1::Projects::Serializers::ProjectSerializer.new(ctx[:model])
    ctx[:status] = :ok
  end
end
