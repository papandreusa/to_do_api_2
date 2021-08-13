class Api::V1::Projects::Operation::Create < Trailblazer::Operation

  step Subprocess(Api::V1::Lib::Operation::Authenticate)
  step :build_model!
  step :assign_current_user!
  step :assign_contract!
  step :validate!
  step :save!
  pass :set_data

  def build_model!(options, **)
    options[:model] = ::Project.new
  end

  def assign_current_user!(options,  **)
    options[:model].user = options[:current_user]
  end

  def assign_contract!(options, **)
    options[:contract] = Api::V1::Projects::Contract::Create.new(options[:model])
  end

  def validate!(options, params:,**)
    options[:contract].validate(params)
  end

  def save!(options, params:, **)
    options[:contract].save(params)
  end

  def set_data(options, params:, **)
    options[:data] = options[:model]
  end
end
