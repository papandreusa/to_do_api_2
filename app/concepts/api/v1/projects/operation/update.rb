class Api::V1::Projects::Operation::Update < Api::V1::Projects::Operation::Create
  step :model!, override: true
  step Policy::Pundit(Api::V1::Projects::Policy::ProjectPolicy, :update?), name: :project_policy, override: true
  step :assign_contract!, override: true

  def model!(options, params:, **)
    options[:model] = options[:current_user].projects.find_by(id: params[:id])
  end

  def assign_contract!(options, **)
    options[:contract] = Api::V1::Projects::Contract::Update.new(options[:model])
  end
end
