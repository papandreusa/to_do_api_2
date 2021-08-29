class Api::V1::Projects::Policies::ProjectPolicy < ::ApplicationPolicy
  def index?
    user.present?
  end

  def manage?
    record.user_id == user.id
  end

  alias show? manage?
  alias create? manage?
  alias update? manage?
  alias destroy? manage?

  class Scope < ::ApplicationPolicy::Scope
    def resolve
      scope.where(user_id: user.id)
    end
  end
end
