class Api::V1::ProjectsController < Api::V1::BaseController
  include Api::V1::Projects

  def index
    endpoint operation: Operations::Index
  end

  def show
    endpoint operation: Operations::Show
  end

  def create
    endpoint operation: Operations::Create
  end

  def update
    endpoint operation: Operations::Update
  end

  def destroy
    endpoint operation: Operations::Destroy
  end
end
