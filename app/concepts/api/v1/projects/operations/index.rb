class Api::V1::Projects::Operations::Index < Trailblazer::Operation
  step :assign_collection
  step Api::V1::Lib::Macro::AssignData(serializer: Api::V1::Projects::Serializers::ProjectSerializer,
                                       type: :collection,
                                       params: :params,
                                       pagy: :pagy)

  def assign_collection(ctx, current_user:, params:, **)
    ctx[:pagy], ctx[:collection] =
      Api::V1::Projects::Services::FetchProjectsService.call(current_user: current_user, params: params)
  end
end
