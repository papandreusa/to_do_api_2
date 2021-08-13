class Api::V1::Projects::Operation::Destroy < Api::V1::Lib::Operation::BaseOperation
  step :model!
  step Policy::Pundit(Api::V1::Projects::Policy::ProjectPolicy, :destroy?)
  step :destroy_model!

  def model!(options, params:, **)
    options[:model] = options[:current_user].projects.find_by(id: params[:id])
  end

  def destroy_model!(options, **)
    options[:model].destroy
  end
end
