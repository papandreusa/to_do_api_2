class Api::V1::ProjectsController < Api::V1::BaseController
  def index
    endpoint(operation: Api::V1::Projects::Operation::Index)
  end

  def show
    
  end

  def create
    endpoint(operation: Api::V1::Projects::Operation::Create, options: { user: current_user })
  end

  def update

  end

  def destroy

  end
end
