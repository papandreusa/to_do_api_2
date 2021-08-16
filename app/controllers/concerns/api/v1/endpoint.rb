module Api::V1::Endpoint
  include SimpleEndpoint::Controller

  private

  def endpoint_options
    { params: params, request: request }
  end

  def default_cases
    {
      created: ->(result) { created_case?(result) },
      deleted: ->(result) { deleted_case?(result) },
      success: ->(result) { result.success? },
      unauthorized: ->(result) { unauthorized_case?(result) },
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
      deleted: ->(result, **) { deleted_hadler(result) },
      unauthorized: ->(result, **) { unautherized_handler(result) },
      forbidden: ->(result, **) { forbidden_handler(result) },
      not_found: ->(result, **) { not_found_handler(result) },
      unprocessable_entity: ->(result, **) { unprocessable_entity_handler(result) },
      bad_request: ->(_result, **) { bad_request_handler(result) }
    }
  end

  def created_case?(result)
    result.success? & result[:acton] == :create
  end

  def deleted_case?(result)
    result.success? & result[:action] == :destroy
  end

  def unauthorized_case?(result)
    result.failure? and result[:status] == :unauthorized
  end

  def forbidden_case?(result)
    result.failure? & result['result.policy.default']&.failure?
  end

  def not_found_case?(result)
    result.failure? and result[:model].nil?
  end

  def unprocessable_entity_case?(result)
    result.failure? & result[:contract]&.errors.present?
  end

  def success_handler(result)
    render json: result[:data] , status: :ok
  end

  def created_handler(result)
    render json:  result[:data] , status: :ok
  end

  def deleted_handler(result)
    render json:  result[:data] , status: :no_content
  end

  def unautherized_handler(_result)
    render json: I18n.t(:unauthorized, scope: :statuses), status: :unauthorized
  end

  def forbidden_handler(_result)
    render json: I18n.t(:forbidden, scope: :statuses), status: :forbidden
  end

  def not_found_handler(_result)
    render json: I18n.t(:not_found, scope: :statuses), status: :not_found
  end

  def unprocessable_entity_handler(result)
    render json: result[:contract].errors.messages, status: :unprocessable_entity
  end

  def bad_result_handler(_result)
    render json: I18n.t(:bad_request, scope: :statuses), status: :bad_request
  end
end