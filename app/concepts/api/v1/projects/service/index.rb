class Api::V1::Projects::Service::Index < ::ToDoService
  def call
    fetch
  end

  private

  def fetch
    context[:data] = Project.all
    context[:status] = :ok
  rescue StandardError
    context[:error] = :data_access_error
  end
end
