class Api::V1::Projects::Services::FetchProjectsService
  include Api::V1::Projects
  include Pagy::Backend

  def self.call(**args)
    new(**args).call
  end

  def initialize(current_user:, params:, **)
    @current_user = current_user
    @params = params
  end

  def call
    fetch_projects
  end

  private

  attr_reader :current_user, :params

  def fetch_projects
    pagy(Policies::ProjectPolicy::Scope.new(current_user, Project).resolve, permitted_params)
  end

  def permitted_params
    params.permit(:page, :items, :after, :before).to_hash.symbolize_keys
  end
end
