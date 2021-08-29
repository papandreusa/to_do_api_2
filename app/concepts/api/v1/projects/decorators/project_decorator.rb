class Api::V1::Projects::Decorators::ProjectDecorator < Api::V1::Lib::Decorators::BaseDecorator
  delegate :name

  class << self
    def instance_url(project)
      h.api_v1_project_path(project)
    end

    def collection_url(**params)
      h.api_v1_projects_path(**permitted_params(params))
    end
  end
end
