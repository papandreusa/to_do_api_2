class Api::V1::ProjectsController < Api::V1::BaseController
  def index
    endpoint operation: Api::V1::Projects::Operations::Index
  end

  def show
    endpoint operation: Api::V1::Projects::Operations::Show
  end

  def create
    endpoint operation: Api::V1::Projects::Operations::Create
  end

  def update
    endpoint operation: Api::V1::Projects::Operations::Update
  end

  def destroy
    endpoint operation: Api::V1::Projects::Operations::Destroy
  end
end
