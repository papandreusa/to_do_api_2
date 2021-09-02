class Api::V1::Projects::Operations::Show < Trailblazer::Operation
  step Model(Project, :find_by)
  step Policy::Pundit(Api::V1::Projects::Policies::ProjectPolicy, :show?)
  pass :assign_data

  def assign_data(ctx, **)
    ctx[:data] = Api::V1::Projects::Serializers::ProjectSerializer.new(ctx[:model])
  end
end
