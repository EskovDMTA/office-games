class GameTypePolicy < ApplicationPolicy
  def destroy?
    user&.admin?
  end

  def update?
    user&.admin?
  end
end
