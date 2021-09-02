class Api::V1::Projects::Operations::Index < Trailblazer::Operation
  step Model(Project, :new)
  step :assign_user
  step Policy::Pundit(Api::V1::Projects::Policies::ProjectPolicy, :index?)
  step :assign_collection
  pass :assign_data

  def assign_user(ctx, current_user:, **)
    ctx[:model].user = current_user
  end

  def assign_collection(ctx, current_user:, params:, **)
    ctx[:pagy], ctx[:collection] =
      Api::V1::Projects::Services::FetchProjectsService.call(current_user: current_user, params: params)
  end

  def assign_data(ctx, params:, pagy:, **)
    ctx[:data] =
      Api::V1::Projects::Serializers::ProjectSerializer.new(ctx[:collection], params: params, pagy: pagy)
  end
end
