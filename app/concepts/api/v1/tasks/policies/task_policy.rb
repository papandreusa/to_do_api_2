class Api::V1::Tasks::Policies::TaskPolicy < ::ApplicationPolicy
  def manage?
    record.project.user == user
  end

  alias  show? manage?
  alias  create? manage?
  alias  update? manage?
  alias  destroy? manage?
  alias  comments? manage?

  class Scope < ::ApplicationPolicy::Scope
    def resolve
      scope.joins(:project).where(projects: { user_id: user.id })
    end
  end
end
