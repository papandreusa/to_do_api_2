class Api::V1::Projects::Operation::Show < Api::V1::Lib::Operation::BaseOperation
  step :model!
  step Policy::Pundit(Api::V1::Projects::Policy::ProjectPolicy, :show?)
  pass :assign_data

  def model!(options, params:, **)
    options[:model] = options[:current_user].projects.find_by(id: params[:id])
  end

  def assign_data(options, **)
    options[:data] = options[:model]
  end
end
