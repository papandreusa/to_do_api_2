class Api::V1::Tasks::Services::FetchTasksService
  include Pagy::Backend

  def self.call(**args)
    new(**args).call
  end

  def initialize(current_user:, project:, params: {}, **)
    @current_user = current_user
    @project = project
    @params = params
  end

  def call
    fetch_tasks
  end

  private

  attr_reader :current_user, :params, :project

  def fetch_tasks
    Api::V1::Tasks::Policies::TaskPolicy::Scope.new(current_user, project.tasks.order(tasks_order)).resolve
  end

  def tasks_order
    Api::V1::Tasks::Constants::ORDERS[params[:sort]] || Api::V1::Tasks::Constants::ORDER_DEFAULT
  end
end
