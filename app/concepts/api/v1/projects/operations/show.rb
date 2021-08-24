class Api::V1::Projects::Operations::Show < Trailblazer::Operation
  include Api::V1::Projects

  step Model(Project, :find_by)
  step Policy::Pundit(Policies::ProjectPolicy, :show?)
  pass :assign_data

  private

  def assign_data(ctx, **)
    ctx[:data] = Serializers::ProjectSerializer.new(ctx[:model])
  end
end
