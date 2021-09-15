class Api::V1::TasksCompletesController < Api::V1::BaseController
  def update
    endpoint operation: Api::V1::Tasks::Operations::UpdateDone
  end
end
