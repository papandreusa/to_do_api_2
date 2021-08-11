class Api::V1::Projects::Service::Show < ::ToDoService
  def call
    context[:data] = object
  rescue StandardError
    context[:error] = :data_access_error
  end

  private

  def object
    @object ||= Project.find(params[:id])
  end
end
