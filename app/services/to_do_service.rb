class ToDoService
  def self.call(*args)
    new(*args).call
  end

  def initialize(params, context)
    @params = params
    @context = context.except!(:error, :data)
  end

  def call(&block)
    block ? yield : raise(NotImplementedError)
  rescue RecordNotFound
    context[:error] = :not_found
  end

  private

  attr_reader :params, :context

  def current_user
    context[:current_user]
  end
end
