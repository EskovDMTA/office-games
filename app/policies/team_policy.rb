class TeamPolicy < ApplicationPolicy
  def create?
    if @user.organization_id.nil?
      raise Pundit::NotAuthorizedError, "Чтобы создать команду необходимо быть в организации"
    else
      true
    end
  end

  def update?
    if @record.captain_id == @user.id
      true
    else
      raise Pundit::NotAuthorizedError, "Вы не являетесь капитаном организации"
    end
  end

  def destroy?
    update?
  end

end
