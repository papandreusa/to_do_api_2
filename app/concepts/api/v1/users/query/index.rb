class Api::V1::Users::Query::Index
  def self.call(*args)
    new(*args).call
  end

  def initialize(params, context)
    @params = params
    @context = context.except!(:error, :data)
  end

  def call
    fetch
  end

  private

  attr_reader :params, :context

  def fetch
    context[:data] = User.all
  end
end
