class Api::V1::Projects::Service::Destroy < ::ToDoService
  def call
    super do
      unless object.destroy
        context[:error] = :method_not_allowed
      end
      context[:data] = object.id
    end
  end

  private

  def object
    @object ||= Project.find(params[:id])
  end
end
