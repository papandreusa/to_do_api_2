class Api::V1::ProjectsController < Api::V1::BaseController
  def index
    endpoint operation: Api::V1::Projects::Operation::Index
  end

  def show
    endpoint operation: Api::V1::Projects::Operation::Show
  end

  def create
    endpoint operation: Api::V1::Projects::Operation::Create
  end

  def update
    endpoint operation: Api::V1::Projects::Operation::Update
  end

  def destroy
    endpoint operation: Api::V1::Projects::Operation::Destroy
  end
end
