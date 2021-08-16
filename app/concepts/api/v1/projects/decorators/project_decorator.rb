class Api::V1::Projects::Decorators::ProjectDecorator < Api::V1::Lib::Decorators::BaseDecorator
  delegate :name

  class << self
    def collection_url(params)
      h.polymorphic_path(%i[api v1 projects], **permitted_params(params))
    end

    def permitted_params(params)
      params.permit(%i[sort page limit])
    end
  end

  def public_url
    h.api_v1_project_path(object)
  end
end
