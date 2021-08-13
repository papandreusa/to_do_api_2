module Api::V1::Endpoint
  include SimpleEndpoint::Controller

  private
  
  def default_cases
    {
      created: -> (result) { result.success? & result[:acton] == :create },
      deleted: ->(result) { result.success? & result[:action] == :destroy },
      success: -> (result) { result.success? },
      unauthorized: -> (result) { result.failure? & unauthorised?(result) },
      invalid: -> (result) { result.failure? }
    }
  end
  
  def default_handler
    {
      success: -> (result, **opts) { render json: {data: result['data']}, **opts, status: 200 },
      created: -> (result, **opts) { render json: {data: result['data']}, **opts, status: 200 },
      deleted: -> (result, **opts) { render json: {info: result['info']}, **opts, status: 200 },
      unauthorized: -> (result, **) { render json: I18n.t(result[:status]),  status: result[:status] },
      invalid: -> (result, **) { render json: result[:contract]&.errors.messages,  status: :unprocessable_entity }
    }
  end
  
  def unauthorised?(result)
    result[:status] == :unauthorized
  end

  # def endpoint_options
  #   { params: unsafe_params }
  # end

  # def unsafe_params
  #   params.to_unsafe_hash
  # end

end
