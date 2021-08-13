class Api::V1::Projects::Operation::Create < Api::V1::Lib::Operation::BaseOperation
  step :model!
  step Policy::Pundit(Api::V1::Projects::Policy::ProjectPolicy, :create?), name: :project_policy
  step :assign_contract!
  step :validate!
  step :save_model!
  pass :assign_data

  def model!(options, **)
    options[:model] = options[:current_user].projects.new
  end

  def assign_contract!(options, **)
    options[:contract] = Api::V1::Projects::Contract::Create.new(options[:model])
  end

  def validate!(options, params:, **)
    options[:contract].validate(params)
  end

  def save_model!(options, params:, **)
    options[:contract].save(params)
  end

  def assign_data(options, **)
    options[:data] = options[:model]
  end
end
