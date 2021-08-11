class Api::V1::Projects::Service::Update < ::ToDoService
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
    @form ||= Api::V1::Projects::Contract::Update.new(object)
  end

  def object
    @object ||= Project.find(params[:id])
  end
end
