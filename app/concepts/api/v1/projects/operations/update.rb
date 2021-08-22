class Api::V1::Projects::Operations::Update < Api::V1::Lib::Operations::BaseOperation
  include Api::V1::Projects

  step Subprocess(Api::V1::Lib::Operations::Authenticate)
  step :assign_model!
  step Policy::Pundit(Policies::ProjectPolicy, :update?)
  step :assign_contract!
  step Subprocess(Api::V1::Lib::Operations::SaveAfterValidation)
  pass :assign_data

  private

  def assign_model!(options, params:, **)
    options[:model] = Project.find_by(id: params[:id])
  end

  def assign_contract!(options, **)
    options[:contract] = Contracts::Update.new(options[:model])
  end

  def assign_data(options, **)
    options[:data] = Serializers::ProjectSerializer.new(options[:model])
    options[:status] = :ok
  end
end
