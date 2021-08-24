class Api::V1::Projects::Operations::Update < Trailblazer::Operation
  include Api::V1::Projects

  step Model(Project, :find_by)
  step Policy::Pundit(Policies::ProjectPolicy, :update?)
  step Contract::Build(constant: Contracts::Update)
  step Contract::Validate()
  step Contract::Persist()
  pass :assign_data

  private

  def assign_data(ctx, **)
    ctx[:data] = Serializers::ProjectSerializer.new(ctx[:model])
    ctx[:status] = :ok
  end
end
