class GamePolicy < ApplicationPolicy
  def destroy?
    user&.admin?
  end

  def update?
    user&.admin?
  end
end
