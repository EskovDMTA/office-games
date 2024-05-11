class TournamentApplicationPolicy < ApplicationPolicy
  def index?
    organization = Organization.find(@record.owner_id)
    if @user.id == organization.owner_id
      true
    else
      raise Pundit::NotAuthorizedError, "Только организатор турнира может просматривать заявки"
    end
  end
end
