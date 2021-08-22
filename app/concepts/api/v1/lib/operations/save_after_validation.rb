class Api::V1::Lib::Operations::SaveAfterValidation < Trailblazer::Operation
  step :validate!
  step :save_model!

  def validate!(options, params:, **)
    options[:contract].validate(params)
  end

  def save_model!(options, params:, **)
    options[:contract].save(params)
  end
end
