module Api
  module V1
    class Endpoint < Trailblazer::Endpoint
      MATCHER = Dry::Matcher.new(
        created: Dry::Matcher::Case.new(
          match:   ->(result) { result.success? && result['model.action'] == :new },
          resolve: ->(result) { result }
        ),
        invalid: Dry::Matcher::Case.new(
          match:   ->(result) { result.failure? && result['result.contract.default'] && result['result.contract.default'].failure? },
          resolve: ->(result) { result }
        )
      )
  
      def matcher
        Api::Endpoint::MATCHER
      end
    end
  end
end
