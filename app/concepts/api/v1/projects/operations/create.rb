class Api::V1::Projects::Operations::Create < Api::V1::Lib::Operations::BaseOperation
  include Api::V1::Projects

  step Subprocess(Api::V1::Lib::Operations::Authenticate)
  step :assign_model!
  step Policy::Pundit(Policies::ProjectPolicy, :create?), name: :project_policy
  step :assign_contract!
  step Subprocess(Api::V1::Lib::Operations::SaveAfterValidation)
  pass :assign_data

  private

  def assign_model!(options, **)
    options[:model] = options[:current_user].projects.new
  end

  def assign_contract!(options, **)
    options[:contract] = Contracts::Create.new(options[:model])
  end

  def assign_data(options, **)
    options[:data] = Serializers::ProjectSerializer.new(options[:model])
    options[:status] = :created
  end
end
