class Api::V1::Projects::Policy::ProjectPolicy < ::ApplicationPolicy
  def index?
    true
  end

  def show?
    record.user == user
  end

  def create?
    true
  end

  def update?
    show?
  end

  def destroy?
    show?
  end

  class Scope < ::ApplicationPolicy::Scope
    def resolve
      scope.where(user_id: user.id)
    end
  end
end
