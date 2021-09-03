class Api::V1::Tasks::Operations::Destroy < Trailblazer::Operation
  step Model(Task, :find_by)
  step Policy::Pundit(Api::V1::Tasks::Policies::TaskPolicy, :destroy?)
  step :destroy_model

  def destroy_model(ctx, **)
    ctx[:model].destroy
  end
end
