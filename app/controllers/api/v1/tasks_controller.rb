class Api::V1::TasksController < Api::V1::BaseController
  def index
    endpoint operation: Api::V1::Tasks::Operations::Index
  end

  def show
    endpoint operation: Api::V1::Tasks::Operations::Show
  end

  def create
    endpoint operation: Api::V1::Tasks::Operations::Create
  end

  def update
    endpoint operation: Api::V1::Tasks::Operations::Update
  end

  def destroy
    endpoint operation: Api::V1::Tasks::Operations::Destroy
  end
end
