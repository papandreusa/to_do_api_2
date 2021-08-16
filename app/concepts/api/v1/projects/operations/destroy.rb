class Api::V1::Projects::Operations::Destroy < Api::V1::Lib::Operations::BaseOperation
  include Api::V1::Projects

  step :model!
  step Policy::Pundit(Policies::ProjectPolicy, :destroy?)
  step :destroy_model!

  def model!(options, params:, **)
    options[:model] = options[:current_user].projects.find_by(id: params[:id])
  end

  def destroy_model!(options, **)
    options[:model].destroy
  end
end
