class Api::V1::Projects::Operations::Create < Trailblazer::Operation
  step Model(Project, :new)
  pass :assign_user
  step Policy::Pundit(Api::V1::Projects::Policies::ProjectPolicy, :create?)
  step Contract::Build(constant: Api::V1::Projects::Contracts::Create)
  step Contract::Validate()
  step Contract::Persist()
  pass :assign_data

  def assign_user(ctx, current_user:, **)
    ctx[:model].user = current_user
  end

  def assign_data(ctx, **)
    ctx[:data] = Api::V1::Projects::Serializers::ProjectSerializer.new(ctx[:model])
    ctx[:status] = :created
  end
end
