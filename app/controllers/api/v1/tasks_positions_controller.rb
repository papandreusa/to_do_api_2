class Api::V1::TasksPositionsController < Api::V1::BaseController
  def update
    endpoint operation: Api::V1::Tasks::Operations::UpdatePosition
  end
end
