class Api::V1::Projects::Operations::Destroy < Trailblazer::Operation
  include Api::V1::Projects

  step Model(Project, :find_by)
  step Policy::Pundit(Policies::ProjectPolicy, :destroy?)
  step :destroy_model!

  private

  def destroy_model!(ctx, **)
    ctx[:model].destroy
  end
end
