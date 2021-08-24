class Api::V1::Projects::Operations::Index < Trailblazer::Operation
  include Api::V1::Projects

  step Model(Project, :new)
  step Policy::Pundit(Policies::ProjectPolicy, :index?)
  step :assign_collection!
  pass :assign_data

  private

  def assign_collection!(ctx, current_user:, params:, **)
    ctx[:pagy], ctx[:collection] =
      Services::FetchProjectsService.call(current_user: current_user, params: params)
  end

  def assign_data(ctx, params:, pagy:, **)
    ctx[:data] =
      Serializers::ProjectSerializer.new(ctx[:collection], params: params, pagy: pagy)
  end
end
