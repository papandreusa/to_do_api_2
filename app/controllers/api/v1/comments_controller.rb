class Api::V1::CommentsController < Api::V1::BaseController
  def index
    endpoint operation: Api::V1::Comments::Operations::Index
  end

  def create
    endpoint operation: Api::V1::Comments::Operations::Create
  end

  def destroy
    endpoint operation: Api::V1::Comments::Operations::Destroy
  end
end
