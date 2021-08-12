class Api::V1::ProjectsController < Api::V1::BaseController
  def index
    # super do
    #   Api::V1::Projects::Service::Index.call(context, params)
    # end
    result = Api::V1::Projects::Operation::Index.( user: context[:current_user])
    endpoint 
  end

  def show
    super do
      Api::V1::Projects::Service::Show.call(context, params)
    end
  end

  def create
    # super do
    #   Api::V1::Projects::Service::Create.call(context, params)
    # end
    result = Api::V1::Projects::Operation::Create.( params: params, user: context[:current_user])
    endpoint result
  end

  def update
    super do
      Api::V1::Projects::Service::Update.call(context, params)
    end
  end

  def destroy
    super do
      Api::V1::Projects::Service::Destroy.call(context, params)
    end
  end
end
