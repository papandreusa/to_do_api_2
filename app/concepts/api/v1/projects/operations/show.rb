class Api::V1::Projects::Operations::Show < Api::V1::Lib::Operations::BaseOperation
  include Api::V1::Projects

  step Subprocess(Api::V1::Lib::Operations::Authenticate)
  step :assign_model!
  step Policy::Pundit(Policies::ProjectPolicy, :show?)
  pass :assign_data

  private

  def assign_model!(options, params:, **)
    options[:model] = options[:current_user].projects.find_by(id: params[:id])
  end

  def assign_data(options, **)
    options[:data] = Serializers::ProjectSerializer.new(options[:model])
  end
end
