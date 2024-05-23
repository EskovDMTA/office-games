class TournamentPolicy < ApplicationPolicy
  def create?
    if @user.id == @record.owner_id
      true
    else
      raise Pundit::NotAuthorizedError, "Вы не являетесь владельцем данной организации"
    end
  end

  def update?
    create?
  end

  def destroy?
    create?
  end
end
