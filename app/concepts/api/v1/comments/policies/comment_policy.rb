class Api::V1::Comments::Policies::CommentPolicy < ::ApplicationPolicy
  def manage?
    record.task&.project&.user_id == user.id
  end

  alias index? manage?
  alias create? manage?
  alias destroy? manage?

  class Scope < ::ApplicationPolicy::Scope
    def resolve
      scope.joins(:task).joins(task: :project).where(projects: { user_id: user.id })
    end
  end
end
