class Api::V1::Projects::Decorators::ProjectDecorator < Api::V1::Lib::Decorators::BaseDecorator
  delegate :name

  class << self
    def collection_url(**params)
      h.api_v1_projects_path(**permitted_params(params))
    end

    def permitted_params(params)
      params.slice(*%i[sort page limit items after before])
    end
  end

  def public_url
    h.api_v1_project_path(object)
  end
end
