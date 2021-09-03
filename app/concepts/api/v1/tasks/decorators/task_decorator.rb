class Api::V1::Tasks::Decorators::TaskDecorator < Api::V1::Lib::Decorators::BaseDecorator
  delegate :name

  class << self
    def instance_url(task)
      h.api_v1_task_path(task)
    end

    def collection_url(project, **params)
      h.api_v1_project_tasks_path(project, **permitted_params(params))
    end

    def permitted_params(params)
      params.slice(:sort)
    end
  end
end
