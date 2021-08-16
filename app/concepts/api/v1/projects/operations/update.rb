class Api::V1::Projects::Operations::Update < Api::V1::Projects::Operations::Create
  include Api::V1::Projects

  step :model!, override: true
  step Policy::Pundit(Policies::ProjectPolicy, :update?), name: :project_policy, override: true
  step :assign_contract!, override: true

  def model!(options, params:, **)
    options[:model] = options[:current_user].projects.find_by(id: params[:id])
  end

  def assign_contract!(options, **)
    options[:contract] = Contracts::Update.new(options[:model])
  end
end
