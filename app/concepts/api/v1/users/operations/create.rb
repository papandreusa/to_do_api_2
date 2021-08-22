class Api::V1::Users::Operations::Create < Trailblazer::Operation
  include Api::V1::Users

  step :assign_model!
  step :assign_contract!
  step :validate!
  step :save_model!
  step Subprocess(Api::V1::Sessions::Operations::Create)

  def assign_model!(options, **)
    options[:model] = User.new
  end

  def assign_contract!(options, **)
    options[:contract] = Contracts::Create.new(options[:model])
  end

  def validate!(options, params:, **)
    options[:contract].validate(params)
  end

  def save_model!(options, params:, **)
    options[:contract].save(params)
  end
end
