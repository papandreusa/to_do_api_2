class Api::V1::Comments::Operations::Destroy < Trailblazer::Operation
  step Model(Comment, :find_by)
  step Policy::Pundit(Api::V1::Comments::Policies::CommentPolicy, :destroy?)
  step :destroy_model

  def destroy_model(ctx, **)
    ctx[:model].destroy
  end
end
