module Api::V1::Endpoint
  include SimpleEndpoint::Controller

  private
  
  def default_cases
    {
      success: -> (result) { result.success? },
      invalid: -> (result) { result.failure? }
    }
  end
  
  def default_handler
    {
      success: -> (result, **opts) { render json: result['model'], **opts, status: 200 },
      invalid: -> (result, **) { render json: result['contract.default'].errors, serializer: ErrorSerializer, status: :unprocessable_entity }
    }
  end

  def endpoint_options
    { params: unsafe_params }
  end

  def unsafe_params
    params.to_unsafe_hash
  end
end
