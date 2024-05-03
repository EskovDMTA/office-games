class OrganizationPolicy < ApplicationPolicy
  def create?
    puts @user.owned_organizations.present?
    if @user.owned_organizations.present?
      raise Pundit::NotAuthorizedError, "Вы уже являетесь владельцем организации"
    elsif @user.organization.present?
      raise Pundit::NotAuthorizedError, "Вы состоите в организации"
    else
      true
    end
  end

  def update?
    if @record.owner_id == @user.id
      true
    else
      raise Pundit::NotAuthorizedError, "Вы не являетесь владельцем организации"
    end
  end

  def destroy?
    update?
  end

end
