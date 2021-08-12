class SimpleEndpoint::Endpoint
  def self.call(operation, handler, cases, renderer_options = {}, before_response = {}, args = {})
    result = operation.call(**args)
    new.call(result, cases, renderer_options, handler, before_response)
  end
end
