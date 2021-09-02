class Api::V1::Projects::Operations::Destroy < Trailblazer::Operation
  step Model(Project, :find_by)
  step Policy::Pundit(Api::V1::Projects::Policies::ProjectPolicy, :destroy?)
  step :destroy_model

  def destroy_model(ctx, **)
    ctx[:model].destroy
  end
end
