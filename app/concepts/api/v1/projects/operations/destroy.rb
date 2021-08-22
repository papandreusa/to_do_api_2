class Api::V1::Projects::Operations::Destroy < Api::V1::Lib::Operations::BaseOperation
  include Api::V1::Projects

  step Subprocess(Api::V1::Lib::Operations::Authenticate)
  step :assign_model!
  step Policy::Pundit(Policies::ProjectPolicy, :destroy?)
  step :destroy_model!

  private

  def assign_model!(options, params:, **)
    options[:model] = Project.find_by(id: params[:id])
  end

  def destroy_model!(options, **)
    options[:model].destroy
  end
end
