class Api::V1::Projects::Decorators::ProjectDecorator < Api::V1::Lib::Decorators::BaseDecorator
  delegate :name

  def public_url
    h.api_v1_project_path(self)
  end
end
