class Api::V1::Projects::Operations::Create < Trailblazer::Operation
  include Api::V1::Projects

  step Model(Project, :new)
  pass :assign_user
  step Policy::Pundit(Policies::ProjectPolicy, :create?)
  step Contract::Build(constant: Contracts::Create)
  step Contract::Validate()
  step Contract::Persist()
  pass :assign_data

  private

  def assign_user(ctx, current_user:, **)
    ctx[:model].user = current_user
  end

  def assign_data(ctx, **)
    ctx[:data] = Serializers::ProjectSerializer.new(ctx[:model])
    ctx[:status] = :created
  end
end
