class Api::V1::Lib::Decorators::BaseDecorator < ::Draper::Decorator
  include Draper::LazyHelpers

  class << self
    def permitted_params(params)
      params.slice(*%i[sort page limit after before])
    end
  end
end
