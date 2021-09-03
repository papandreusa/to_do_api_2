module Api::V1::Endpoint
  include SimpleEndpoint::Controller

  private

  def endpoint_options
    { params: params }
  end

  def default_cases
    {
      created: ->(result) { created_case?(result) },
      deleted: ->(result) { deleted_case?(result) },
      success: ->(result) { result.success? },
      forbidden: ->(result) { forbidden_case?(result) },
      not_found: ->(result) { not_found_case?(result) },
      unprocessable_entity: ->(result) { unprocessable_entity_case?(result) },
      bad_request: ->(result) { result.failure? }
    }
  end

  def default_handler
    {
      success: ->(result, **) { success_handler(result) },
      created: ->(result, **) { created_handler(result) },
      deleted: ->(result, **) { deleted_handler(result) },
      forbidden: ->(result, **) { forbidden_handler(result) },
      not_found: ->(result, **) { not_found_handler(result) },
      unprocessable_entity: ->(result, **) { unprocessable_entity_handler(result) },
      bad_request: ->(result, **) { bad_request_handler(result) }
    }
  end

  def created_case?(result)
    result.success? and result[:params][:action].to_sym == :create
  end

  def deleted_case?(result)
    result.success? and result[:params][:action].to_sym == :destroy
  end

  def forbidden_case?(result)
    result.failure? and result['result.policy.default']&.failure?
  end

  def not_found_case?(result)
    result.failure? and result[:model].nil?
  end

  def unprocessable_entity_case?(result)
    result.failure? and result['contract.default']&.errors.present?
  end

  def success_handler(result)
    render json: result[:data], status: :ok
  end

  def created_handler(result)
    render json: result[:data], status: :created
  end

  def deleted_handler(_result)
    render status: :no_content
  end

  def forbidden_handler(_)
    render status: :forbidden
  end

  def not_found_handler(_)
    render status: :not_found
  end

  def unprocessable_entity_handler(result)
    render json: Api::V1::Lib::Serializers::ErrorSerializer.new(result['contract.default'].errors).serialize,
           status: :unprocessable_entity
  end

  def bad_request_handler(_)
    render status: :bad_request
  end
end
