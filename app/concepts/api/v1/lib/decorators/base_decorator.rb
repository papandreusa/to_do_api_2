class Api::V1::Lib::Decorators::BaseDecorator < ::Draper::Decorator
  include Draper::LazyHelpers

  class << self
    def permitted_params(params)
      params.except(*%i[controller action format])
    end
  end
end
