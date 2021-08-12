module DefaultEndpoints
  protected

  def default_handler
    lambda do |m|
      m.created do |result|
        render jsonapi: result[:model], **result[:renderer_options], status: :created
      end
      m.invalid do |result|
        render jsonapi_errors: result['contract.default'].errors,
                        class: {
                          'Reform::Form::ActiveModel::Errors': JSONAPI::Rails::SerializableActiveModelErrors
                          },
                        status: :unprocessable_entity
      end
    end
  end

  def endpoint(operation_class, _options = {}, &block)
    Api::V1::Endpoint.call(operation_class, default_handler, { params: params.to_unsafe_h }, &block)
  end
end
