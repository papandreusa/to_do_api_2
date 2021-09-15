class Api::V1::ApiDocsController < ActionController::Base
  def show
    render file: Api::V1::Constants::ApiDoc::API_DOCS_HTML, layout: false
  end
end
