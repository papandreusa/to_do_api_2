class Api::V1::Projects::Service::Create < ::ToDoService
  def call
    super do
      unless form.validate(params)
        context[:error] = :validation_error
        context[:text] = form.errors.messages
        return

      end
      form.save(params)
      context[:data] = form.model
    end
  end

  private

  def form
    @form ||= Api::V1::Projects::Contract::Create.new(current_user.projects.build)
  end
end
