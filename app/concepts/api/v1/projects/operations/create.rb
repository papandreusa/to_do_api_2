class Api::V1::Projects::Operations::Create < Api::V1::Lib::Operations::BaseOperation
  include Api::V1::Projects

  step :model!
  step Policy::Pundit(Policies::ProjectPolicy, :create?), name: :project_policy
  step :assign_contract!
  step :validate!
  step :save_model!
  pass :assign_data

  def model!(options, **)
    options[:model] = options[:current_user].projects.new
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

  def assign_data(options, **)
    options[:data] = Serializers::ProjectSerializer.new(options[:model])
    options[:status] = :created
  end
end
