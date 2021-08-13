class Api::V1::ProjectsController < Api::V1::BaseController
  def index
    endpoint(operation: Api::V1::Projects::Operation::Index, options: {request: request})
  end

  def show
    
  end

  def create
    endpoint(operation: Api::V1::Projects::Operation::Create, options: {request: request})
  end

  def update

  end

  def destroy

  end
end
